using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace CafeApplication.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageCombo.xaml
    /// </summary>
    public partial class PageCombo : Page
    {
        public PageCombo()
        {
            InitializeComponent();
            PageStartUp();            
        }

        private void PageStartUp()
        {
            if (Properties.Settings.Default.globalRole != "manager")
            {
                lvCombos.MouseDoubleClick -= lvCombos_MouseDoubleClick;
                lvCombos.ToolTip = null;
                btnAdd.Visibility = Visibility.Hidden;
            }

            var currentProducts = DB.db.Combo.ToList();
            var sort = new List<string>();

            sort.Add("Сортировка");
            sort.Add("По названию, от А до Я");
            sort.Add("По названию, от Я до А"); ;
            sort.Add("По возрастанию стоимости"); ;
            sort.Add("По убыванию стоимости"); ;

            lvCombos.ItemsSource = currentProducts;

            cbSort.ItemsSource = sort;
            cbSort.SelectedIndex = 0;
        }

        void UpdateLvItems()
        {
            var currentCombos = DB.db.Combo.ToList();

            if (cbSort.SelectedIndex > 0)
            {
                switch (cbSort.SelectedIndex)
                {
                    case 1:
                        currentCombos = currentCombos.OrderBy(p => p.Title).ToList();
                        break;
                    case 2:
                        currentCombos = currentCombos.OrderByDescending(p => p.Title).ToList();
                        break;
                    case 3:
                        currentCombos = currentCombos.OrderBy(p => p.Cost).ToList();
                        break;
                    case 4:
                        currentCombos = currentCombos.OrderByDescending(p => p.Cost).ToList();
                        break;
                }
            }

            if (tbFinder.Text != null)
                currentCombos = currentCombos.Where(s => s.Title.ToLower().Contains(tbFinder.Text.ToLower())).ToList();

            lvCombos.ItemsSource = currentCombos;

            tbRecordsCount.Text = lvCombos.Items.Count.ToString();
            tbRecordsCountAll.Text = DB.db.Combo.Count().ToString();

            if (lvCombos.Items.Count == 0)
            {
                lvCombos.Visibility = Visibility.Hidden;
                tbAvailable.Visibility = Visibility.Visible;
            }
            else
            {
                lvCombos.Visibility = Visibility.Visible;
                tbAvailable.Visibility = Visibility.Hidden;
            }
        }

        private void tbFinder_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateLvItems();
        }

        private void cbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateLvItems();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.mainFrame.Navigate(new PageAddEditCombo(new Combo()));
        }

        private void lvCombos_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            try
            {
                DB.db.ChangeTracker.Entries().ToList().ForEach(a => a.Reload());
                UpdateLvItems();
            }
            catch (Exception)
            {
            }
        }

        private void lvCombos_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            Manager.mainFrame.Navigate(new PageAddEditCombo(lvCombos.SelectedItem as Combo));
        }
    }
}
