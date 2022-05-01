﻿using CafeApplication.Pages;
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

namespace CafeApplication
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow(int roleID)
        {
            InitializeComponent();

            Manager.mainFrame = windowFrame;
            windowFrame.Navigate(new PageMenu(roleID));
            //new WindowAutorization().Show();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            new WindowAutorization().Show();
            this.Close();
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            if (Manager.mainFrame.CanGoBack)
            {
                Manager.mainFrame.GoBack();
            }
        }
    }
}
