﻿#pragma checksum "..\..\..\Pages\PageCombo.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "B1524152527D94738763AA20FD675E68BC64E61604B932FC3223693FA5A587DE"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using CafeApplication.Pages;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace CafeApplication.Pages {
    
    
    /// <summary>
    /// PageCombo
    /// </summary>
    public partial class PageCombo : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 28 "..\..\..\Pages\PageCombo.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbFinder;
        
        #line default
        #line hidden
        
        
        #line 29 "..\..\..\Pages\PageCombo.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbSort;
        
        #line default
        #line hidden
        
        
        #line 32 "..\..\..\Pages\PageCombo.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock tbRecordsCount;
        
        #line default
        #line hidden
        
        
        #line 34 "..\..\..\Pages\PageCombo.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock tbRecordsCountAll;
        
        #line default
        #line hidden
        
        
        #line 37 "..\..\..\Pages\PageCombo.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView lvCombos;
        
        #line default
        #line hidden
        
        
        #line 70 "..\..\..\Pages\PageCombo.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnAdd;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/CafeApplication;component/pages/pagecombo.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\PageCombo.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.tbFinder = ((System.Windows.Controls.TextBox)(target));
            
            #line 28 "..\..\..\Pages\PageCombo.xaml"
            this.tbFinder.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.tbFinder_TextChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            this.cbSort = ((System.Windows.Controls.ComboBox)(target));
            
            #line 29 "..\..\..\Pages\PageCombo.xaml"
            this.cbSort.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.cbSort_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.tbRecordsCount = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 4:
            this.tbRecordsCountAll = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 5:
            this.lvCombos = ((System.Windows.Controls.ListView)(target));
            
            #line 37 "..\..\..\Pages\PageCombo.xaml"
            this.lvCombos.IsVisibleChanged += new System.Windows.DependencyPropertyChangedEventHandler(this.lvCombos_IsVisibleChanged);
            
            #line default
            #line hidden
            
            #line 37 "..\..\..\Pages\PageCombo.xaml"
            this.lvCombos.MouseDoubleClick += new System.Windows.Input.MouseButtonEventHandler(this.lvCombos_MouseDoubleClick);
            
            #line default
            #line hidden
            return;
            case 6:
            this.btnAdd = ((System.Windows.Controls.Button)(target));
            
            #line 70 "..\..\..\Pages\PageCombo.xaml"
            this.btnAdd.Click += new System.Windows.RoutedEventHandler(this.btnAdd_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

