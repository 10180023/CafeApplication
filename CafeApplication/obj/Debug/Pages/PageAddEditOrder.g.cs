#pragma checksum "..\..\..\Pages\PageAddEditOrder.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "08B253AC88924BE06F978EED1099ABEB72E5E784032E5903AF37249AEE216BAD"
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
    /// PageAddEditOrder
    /// </summary>
    public partial class PageAddEditOrder : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 35 "..\..\..\Pages\PageAddEditOrder.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnChangeProds;
        
        #line default
        #line hidden
        
        
        #line 39 "..\..\..\Pages\PageAddEditOrder.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnChangeComs;
        
        #line default
        #line hidden
        
        
        #line 44 "..\..\..\Pages\PageAddEditOrder.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock tbStructure;
        
        #line default
        #line hidden
        
        
        #line 49 "..\..\..\Pages\PageAddEditOrder.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbCoupon;
        
        #line default
        #line hidden
        
        
        #line 54 "..\..\..\Pages\PageAddEditOrder.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock tbCost;
        
        #line default
        #line hidden
        
        
        #line 58 "..\..\..\Pages\PageAddEditOrder.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnSave;
        
        #line default
        #line hidden
        
        
        #line 59 "..\..\..\Pages\PageAddEditOrder.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnCancel;
        
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
            System.Uri resourceLocater = new System.Uri("/CafeApplication;component/pages/pageaddeditorder.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\PageAddEditOrder.xaml"
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
            this.btnChangeProds = ((System.Windows.Controls.Button)(target));
            
            #line 35 "..\..\..\Pages\PageAddEditOrder.xaml"
            this.btnChangeProds.Click += new System.Windows.RoutedEventHandler(this.btnChangeProds_Click);
            
            #line default
            #line hidden
            return;
            case 2:
            this.btnChangeComs = ((System.Windows.Controls.Button)(target));
            
            #line 39 "..\..\..\Pages\PageAddEditOrder.xaml"
            this.btnChangeComs.Click += new System.Windows.RoutedEventHandler(this.btnChangeComs_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.tbStructure = ((System.Windows.Controls.TextBlock)(target));
            
            #line 44 "..\..\..\Pages\PageAddEditOrder.xaml"
            this.tbStructure.IsVisibleChanged += new System.Windows.DependencyPropertyChangedEventHandler(this.tbStructure_IsVisibleChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.tbCoupon = ((System.Windows.Controls.TextBox)(target));
            
            #line 49 "..\..\..\Pages\PageAddEditOrder.xaml"
            this.tbCoupon.LostFocus += new System.Windows.RoutedEventHandler(this.tbCoupon_LostFocus);
            
            #line default
            #line hidden
            
            #line 49 "..\..\..\Pages\PageAddEditOrder.xaml"
            this.tbCoupon.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.tbCoupon_TextChanged);
            
            #line default
            #line hidden
            return;
            case 5:
            this.tbCost = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 6:
            this.btnSave = ((System.Windows.Controls.Button)(target));
            
            #line 58 "..\..\..\Pages\PageAddEditOrder.xaml"
            this.btnSave.Click += new System.Windows.RoutedEventHandler(this.btnSave_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.btnCancel = ((System.Windows.Controls.Button)(target));
            
            #line 59 "..\..\..\Pages\PageAddEditOrder.xaml"
            this.btnCancel.Click += new System.Windows.RoutedEventHandler(this.btnCancel_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

