using CafeApplication.Windows;
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
    /// Логика взаимодействия для PageAddEditFoodStaff.xaml
    /// </summary>
    public partial class PageAddEditFoodStaff : Page
    {
        FoodStaff foodStaff = new FoodStaff();

        public PageAddEditFoodStaff(FoodStaff selectedFoodStaff)
        {
            InitializeComponent();
            PageStartUp(selectedFoodStaff);            
        }
        /// <summary>
        /// Преднастройка элементов страницы
        /// </summary>
        /// <param name="selectedFoodStaff"></param>
        private void PageStartUp(FoodStaff selectedFoodStaff)
        {
            if (selectedFoodStaff != null)
                foodStaff = selectedFoodStaff;

            if (foodStaff.FoodStuffID == 0)
                btnDelete.Visibility = Visibility.Hidden;

            cbUnit.ItemsSource = DB.db.Unit.ToList();

            DataContext = foodStaff;
        }
        /// <summary>
        /// Сохранение данных в БД
        /// </summary>
        private void Save()
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(foodStaff.Title))
                errors.AppendLine("Укажите название");
            if (string.IsNullOrWhiteSpace(foodStaff.CountInStock.ToString()) || foodStaff.CountInStock == 0)
                errors.AppendLine("Укажите кол-во на складе");
            if (string.IsNullOrWhiteSpace(foodStaff.MinCount.ToString()) || foodStaff.MinCount == 0)
                errors.AppendLine("Укажите мин. кол-во");
            if (cbUnit.SelectedItem == null)
                errors.AppendLine("Выберите ед. измерения");
            if (string.IsNullOrWhiteSpace(foodStaff.Description))
                errors.AppendLine("Укажите описание");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }            

            try
            {
                if (foodStaff.FoodStuffID == 0)
                    DB.db.FoodStaff.Add(foodStaff);

                DB.db.SaveChanges();
                //MessageBox.Show("Данные сохранены", "Уведомление");
                Manager.mainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        /// <summary>
        /// Удаление записи из БД
        /// </summary>
        private void Delete()
        {
            if (MessageBox.Show("Вы точно хотите удалить запись?", "Внимание", 
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    if ((DB.db.ProductFoodStuff.Where(x => x.FoodStaffID == foodStaff.FoodStuffID)).FirstOrDefault() != null)
                    {
                        MessageBox.Show("Продукт используется в товарах, запись удалить невозможно", "Уведомление", 
                            MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    else
                    {
                        DB.db.FoodStaff.Remove(foodStaff);
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
        /// <summary>
        /// Выбор изображения
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void imgLogo_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            WindowImages window = new WindowImages("FoodStaff");
            window.ShowDialog();

            if (window.DialogResult == true)
            {
                foodStaff.Image = window.imageUrl;
                DataContext = null;
                DataContext = foodStaff;
            }
        }

        private void tbTitle_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsLetter(e.Text, 0))
                e.Handled = true;
        }

        private void tbUnit_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsLetter(e.Text, 0))
                e.Handled = true;
        }

        private void tbMinCount_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string chars = "1234567890.";

            if (!chars.Contains(e.Text[0]))
                e.Handled = true;

            if (tbMinCount.Text.Contains("."))
            {
                if (e.Text == ".")
                    e.Handled = true;
            }
        }

        private void tbCountInStock_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string chars = "1234567890.";

            if (!chars.Contains(e.Text[0]))
                e.Handled = true;

            if (tbCountInStock.Text.Contains("."))
            {
                if (e.Text == ".")
                    e.Handled = true;
            }
        }
    }
}
