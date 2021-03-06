using ClassLibraryCafe;
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

namespace CafeClientApplication.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageAddEditOrderCombos.xaml
    /// </summary>
    public partial class PageAddEditOrderCombos : Page
    {
        private List<ComboItemTemplate> _comboItemTemplates = new List<ComboItemTemplate>();
        private Order order = new Order();

        public PageAddEditOrderCombos(Order selectedOrder)
        {
            InitializeComponent();
            ShowCombos();

            if (selectedOrder != null)
            {
                order = selectedOrder;
            }

            DataContext = this.order;
        }

        private void ShowCombos()
        {
            List<Combo> combos = DB.db.Combo.ToList();

            if (!string.IsNullOrEmpty(tbFindFoodStaff.Text))
                combos = combos.Where(p => p.Title.ToLower().Contains(tbFindFoodStaff.Text.ToLower())).ToList();

            lvAllCombos.ItemsSource = combos;

            lvSelectedCombos.Items.Clear();
            foreach (var comboItemTemplate in _comboItemTemplates)
                lvSelectedCombos.Items.Add(comboItemTemplate.GridComboItemTemplate);

            foreach (var comboItemTemplate in _comboItemTemplates)
                combos.Remove(comboItemTemplate.combo);
        }

        private void tbFindCombos_TextChanged(object sender, TextChangedEventArgs e)
        {
            List<Combo> combo = DB.db.Combo.ToList();

            if (!string.IsNullOrEmpty(tbFindFoodStaff.Text))
                combo = combo.Where(c => c.Title.ToLower().Contains(tbFindFoodStaff.Text.ToLower())).ToList();

            lvAllCombos.ItemsSource = combo;

            if (lvAllCombos.Items.Count == 0)
            {
                lvAllCombos.Visibility = Visibility.Hidden;
                tbAvailable.Visibility = Visibility.Visible;
            }
            else
            {
                lvAllCombos.Visibility = Visibility.Visible;
                tbAvailable.Visibility = Visibility.Hidden;
            }

            ShowCombos();
        }

        private void tbCount_TextChanged(object sender, TextChangedEventArgs e)
        {
            decimal fullPrice = 0;

            foreach (var cit in _comboItemTemplates)
            {
                if (!string.IsNullOrEmpty(cit.TbCount.Text))
                {
                    fullPrice += cit.combo.Cost * int.Parse(cit.TbCount.Text);
                }
            }

            tbFullPrice.Text = fullPrice.ToString();
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            tbFindFoodStaff.Text = null;
            ShowCombos();
        }

        private void lbAllCombos_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            btnGetCombo_Click(null, null);
        }

        private void lbAllProducts_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
            //btnGetCombo.IsEnabled = lvAllCombos.SelectedItem != null ? true : false;
        }

        private void btnGetCombo_Click(object sender, RoutedEventArgs e)
        {
            Combo combo = lvAllCombos.SelectedItem as Combo;

            if (combo != null)
            {
                ComboItemTemplate comboItemTemplate = new ComboItemTemplate(combo);
                comboItemTemplate.TbCount.TextChanged += tbCount_TextChanged;
                _comboItemTemplates.Add(comboItemTemplate);
                ShowCombos();
                tbCount_TextChanged(null, null);
            }
        }

        private void btnCancelCombo_Click(object sender, RoutedEventArgs e)
        {
            Grid gridCombosItemTemplate = lvSelectedCombos.SelectedItem as Grid;

            if (gridCombosItemTemplate != null)
            {
                ComboItemTemplate comboItemTemplate = _comboItemTemplates.FirstOrDefault(cit => cit.GridComboItemTemplate == gridCombosItemTemplate);
                if (comboItemTemplate != null)
                {
                    _comboItemTemplates.Remove(comboItemTemplate);
                    ShowCombos();
                    comboItemTemplate.TbCount.TextChanged += tbCount_TextChanged;
                    tbCount_TextChanged(null, null);
                }
            }
        }

        private void lbSelectedCombos_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            btnCancelCombo_Click(null, null);
        }

        private void lbSelectedCombos_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //btnCancelCombo.IsEnabled = lvSelectedCombos.SelectedItem != null ? true : false;
        }

        private bool CheckData()
        {
            bool trueData = true;
            string errorMessage = "Введены некорректные данные:\n";

            if (_comboItemTemplates.Count == 0)
            {
                errorMessage += "Не выбран ни один товар\n";
                trueData = false;
            }

            foreach (var comboItemTemplate in _comboItemTemplates)
            {
                if (comboItemTemplate.TbCount.Text == "0")
                {
                    errorMessage += "Количество не должно быть 0\n";
                    trueData = false;
                }
            }

            if (!trueData)
                MessageBox.Show(errorMessage, "Внимание",
                    MessageBoxButton.OK, MessageBoxImage.Error);

            return trueData;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (CheckData())
            {
                foreach (var item in DB.db.OrderCombo.Where(x => x.OrderID == order.OrderID))
                    DB.db.OrderCombo.Remove(item);

                if (order.OrderID == 0)
                {
                    order.OrderDateTime = DateTime.Now;
                    order.UserID = Properties.Settings.Default.userID;
                    DB.db.Order.Add(order);
                }

                foreach (var comboItemTemplate in _comboItemTemplates)
                {
                    OrderCombo oc = new OrderCombo();
                    oc.ComboID = comboItemTemplate.combo.ComboID;
                    oc.OrderID = order.OrderID;
                    oc.Count = int.Parse(comboItemTemplate.TbCount.Text);

                    DB.db.OrderCombo.Add(oc);
                }

                try
                {
                    DB.db.SaveChanges();
                    Manager.mainFrame.GoBack();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Manager.mainFrame.GoBack();
            Manager.mainFrame.RemoveBackEntry();
        }
    }
}
