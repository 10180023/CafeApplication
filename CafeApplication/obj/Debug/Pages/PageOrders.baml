   M S B A M L   `   `   `  ����J  FCafeApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:CafeApplication.PagesCafeApplication.Pages  5      &     CafeApplication.Pages.PageOrders   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      5local#clr-namespace:CafeApplication.Pages     5        N� Title$  
PageOrders��5	      .��5      �  � RowDefinitions 5   
   �� 5      $��85 �6   �� 5      $	��110 �6   �� 5      $��8* �6   �� 5      $��85 �6    � ColumnDefinitions 5   
   �� 5      �� 5      �� 5      �� 5      .+�5   
   �� $��Заказы��6   $��4��6"    	  Label#��[  66   �� 5   
   -   5        $��cbUsers��5      $��1��6#   $��0��60     comboBox#��[ 6@   6b   �� 5   
   -   5        $��cbStaff��5      $��1��6#   $��1��60   #��[ 6@   6b   (  "System.Windows.Controls.DatePicker  5   
   -   5        $��calendar��5      $��1��6%   $��2��62      FirstDayOfWeek$ Monday=�6u      SelectedDateFormat$
 Long=�6�   $��28(�6�   �� 5   
    �� Orientation$ 
Horizontal=�6   $��1��6.   $��3��6;   $��Center=�6K   $��Center=�6h   .+�5       �� $��Записей: ��6     tbLvItem#���  6)   �� 5!      -   5        $��tbRecordsCount��5!      #���  6.   �� 5"      $�� из ��6   #���  6$   �� 5#      -   5        $��tbRecordsCountAll��5#      #���  61   5$      �� 5&   
   -   5        $��tbAvailable��5&      $0��*Нет подходящих записей��6'    	 tbAll#���  6E   $��32(�6e   $	��Top=�6s   $��0, 90, 0, 0q�6�   $��2��6�   $��4��6�   $y�Hidden=�6�   �� 5(   
   -   5        $��lvOrders��5(      $��2��6#   $��4��60   6D   �� 5*   
   -   5        $��btnAdd��5*      $!��Добавить заказ��6   $��3��68   $��4��6E   6Y   5+      5,      