using CafeApplication.Windows;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
    /// Логика взаимодействия для PageAddEditProduct.xaml
    /// </summary>
    public partial class PageAddEditProduct : Page
    {
        Product product = new Product();
        ProductFoodStuff productFoodStuff = new ProductFoodStuff();
        List<decimal?> count = new List<decimal?>();
        int t = 0;

        public PageAddEditProduct(Product selectedProduct)
        {
            InitializeComponent();
            PageStartUp(selectedProduct);            
        }

        private void PageStartUp(Product selectedProduct)
        {
            DB.db.ProductFoodStuff.Load();

            if (selectedProduct != null)
                product = selectedProduct;

            if (product.ProductID == 0)
            {
                btnDelete.Visibility = Visibility.Hidden;
                btnChange.IsEnabled = false;
            }
                

            DataContext = product;

            cbTypes.ItemsSource = DB.db.ProductType.ToList();
        }


        private void Save()
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(product.Title))
                errors.AppendLine("Укажите название");
            if (string.IsNullOrWhiteSpace(product.Cost.ToString()) || product.Cost == 0)
                errors.AppendLine("Укажите стоимость");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Внимание", 
                    MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }

            if (product.ProductID == 0)
                DB.db.Product.Add(product);

            try
            {
                DB.db.SaveChanges();
                //MessageBox.Show("Данные сохранены", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                Manager.mainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void Delete()
        {
            if (MessageBox.Show("Вы точно хотите удалить запись?", "Внимание", 
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    if ((DB.db.ComboProduct.Where(x => x.ProductID == product.ProductID)).FirstOrDefault() != null ||
                        (DB.db.OrderProduct.Where(x => x.ProductID == product.ProductID)).FirstOrDefault() != null)
                    {
                        MessageBox.Show("Товар используется в наборах или заказах, запись удалить невозможно", "Уведомление",
                            MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    else
                    {
                        foreach (var item in DB.db.ProductFoodStuff.Where(x => x.ProductID == product.ProductID))
                            DB.db.ProductFoodStuff.Remove(item);

                        DB.db.Product.Remove(product);
                        DB.db.SaveChanges();
                        //MessageBox.Show("Запись удалена", "Уведомление");
                        Manager.mainFrame.GoBack();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            Save();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            Delete();
        }

        private void imgLogo_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            WindowImages window = new WindowImages("combo");
            window.ShowDialog();

            if (window.DialogResult == true)
            {
                product.Image = window.imageUrl;
                DataContext = null;
                DataContext = product;
            }
        }

        private void btnAddType_Click(object sender, RoutedEventArgs e)
        {
            WindowAddProductType window = new WindowAddProductType();
            window.ShowDialog();
            if (window.DialogResult == true)
            {
                cbTypes.ItemsSource = DB.db.ProductType.ToList();
                DataContext = null;
                DataContext = product;
            }
        }

        private void btnChange_Click(object sender, RoutedEventArgs e)
        {
            Manager.mainFrame.Navigate(new PageEditProductStructure((sender as Button).DataContext as Product));
        }

        private void tbStructure_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            try
            {
                DB.db.ChangeTracker.Entries().ToList().ForEach(a => a.Reload());
                tbStructure.Text = product.FoodStaffList;
            }
            catch (Exception)
            {

            }
            
        }

        private void tbTitle_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (string.IsNullOrEmpty(tbTitle.Text))
            {
                btnChange.IsEnabled = false;
            }
            else
            {
                btnChange.IsEnabled = true;
            }
        }

        private void tbTitle_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsLetter(e.Text, 0))
                e.Handled = true;
        }

        private void tbCost_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string chars = "1234567890.";

            if (!chars.Contains(e.Text[0]))
                e.Handled = true;

            if (tbCost.Text.Contains("."))
            {
                if (e.Text == ".")
                    e.Handled = true;
            }
        }
    }
}
