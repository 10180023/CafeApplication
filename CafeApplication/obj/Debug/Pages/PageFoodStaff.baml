   M S B A M L   `   `   `  ����J  FCafeApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:CafeApplication.PagesCafeApplication.Pages  5      )    #CafeApplication.Pages.PageFoodStaff   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      5local#clr-namespace:CafeApplication.Pages     5        N� Title$  PageFoodStaff��5	      .��5      �  � RowDefinitions 5   
   �� 5      $��85 �6   �� 5      $	��110 �6   �� 5      $��8* �6   �� 5      $��85 �6    � ColumnDefinitions 5   
   �� 5      �� 5      �� 5      �� 5      .+�5   
   �� $��Продукты��6   $��4��6$    	  Label#��[  68   �� 5   
   -   5        $��tbFinder��5      $��1��6"   $��0��6/     tbStyle#���  6?    � ToolTip$9 3Введите название для поиска��6a   6�   �� 5   
   -   5        $��cbSort��5      $��1��6"   $��1��6/   $��2��6?   $	��450��6S     comboBox#��[ 6b   6�   �� 5   
    �� Orientation$ 
Horizontal=�6   $��1��6.   $��3��6;   $��Center=�6K   $��Center=�6h   .+�5      �� $��Записей: ��6     tbLvItem#���  6)   �� 5       -   5        $��tbRecordsCount��5       #���  6.   �� 5!      $�� из ��6   #���  6$   �� 5"      -   5        $��tbRecordsCountAll��5"      #���  61   5#      �� 5%   
   -   5        $��tbAvailable��5%      $0��*Нет подходящих записей��6'    	 tbAll#���  6E   $��32(�6e   $	��Top=�6s   $��0, 90, 0, 0q�6�   $��2��6�   $��4��6�   $y�Hidden=�6�   �� 5'   
   -   5        $��lvFoodStaff��5'      $��2��6&   $��4��63   $; 5Для просмотра нажмите дважды��6�   ��5(      �� 5)      .R�5*      �  5+      �� 5,      $
��0.7* �6/   �� 5-      $	��110 �6/   �� 5.      $	��500 �6/   �� 5/      $��* �6/   .+�52      ��  �� CornerRadius$ 10��6!   $��5��63   $��0q�6G    J� Opacity$ 10Q�6R   ��53      �� 54   "    �� Opacity$	 0.5Q�6O    �� Color 62   �� *
ValidColor+6O   56      �� 58      $��1��6!   $��Right=�61     brdImage#���  6M   $	��100��6q   $	��100��6}   ._�59      �� $��imgLogo��6$   ��63   �� *
ValidImage+5:      �� 5<      $��2��6%   $��Center=�65   $��50, 0, 0, 0q�6P   .+�5=      �� #���  6?   $
��Bold"�6b   ��6(   �� *Title+6b   �� 5>      $ 
Horizontal=�6)   $
��Left=�6B   .+�5?   "   �� $��Мин. кол-во: ��6,   #���  6A   �� 5@   "   #���  6F   ��6,   �� *
MinCount+6F   �� 5A   "   $�� ��6,   #���  65   �� 5B   "   #���  6G   ��6,   �� *	ValidUnit+6G   5C      5D      �� 5F      $��3��6%   $��Center=�65   .+�5G      �� $'��!Остатки на складе:��6(   #���  6B   �� 5H      $ 
Horizontal=�6)   $
��Left=�6B   .+�5I   "   �� #���  6J   ��6,   �� *CountInStock+6J   �� 5J   "   $�� ��6,   #���  65   �� 5K   "   #���  6G   ��6,   �� *	ValidUnit+6G   5L      5M      5O      5P      5R      �� 5T   
   -   5        $��btnAdd��5T      $%��Добавить продукт��6   $��3��6:   $��4��6G   6[   5U      5V      