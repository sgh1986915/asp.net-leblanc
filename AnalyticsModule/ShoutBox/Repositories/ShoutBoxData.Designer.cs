﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Data.EntityClient;
using System.ComponentModel;
using System.Xml.Serialization;
using System.Runtime.Serialization;

[assembly: EdmSchemaAttribute()]

namespace RobustHaven.Areas.ShoutBox.Repositories
{
    #region Contexts
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    public partial class TradingViewsEntities : ObjectContext
    {
        #region Constructors
    
        /// <summary>
        /// Initializes a new TradingViewsEntities object using the connection string found in the 'TradingViewsEntities' section of the application configuration file.
        /// </summary>
        public TradingViewsEntities() : base("name=TradingViewsEntities", "TradingViewsEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new TradingViewsEntities object.
        /// </summary>
        public TradingViewsEntities(string connectionString) : base(connectionString, "TradingViewsEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new TradingViewsEntities object.
        /// </summary>
        public TradingViewsEntities(EntityConnection connection) : base(connection, "TradingViewsEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        #endregion
    
        #region Partial Methods
    
        partial void OnContextCreated();
    
        #endregion
    
        #region ObjectSet Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        public ObjectSet<ShoutBox> ShoutBoxes
        {
            get
            {
                if ((_ShoutBoxes == null))
                {
                    _ShoutBoxes = base.CreateObjectSet<ShoutBox>("ShoutBoxes");
                }
                return _ShoutBoxes;
            }
        }
        private ObjectSet<ShoutBox> _ShoutBoxes;

        #endregion
        #region AddTo Methods
    
        /// <summary>
        /// Deprecated Method for adding a new object to the ShoutBoxes EntitySet. Consider using the .Add method of the associated ObjectSet&lt;T&gt; property instead.
        /// </summary>
        public void AddToShoutBoxes(ShoutBox shoutBox)
        {
            base.AddObject("ShoutBoxes", shoutBox);
        }

        #endregion
    }
    

    #endregion
    
    #region Entities
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="TradingViewsModel", Name="ShoutBox")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class ShoutBox : EntityObject
    {
        #region Factory Method
    
        /// <summary>
        /// Create a new ShoutBox object.
        /// </summary>
        /// <param name="id">Initial value of the id property.</param>
        /// <param name="message">Initial value of the message property.</param>
        /// <param name="createdon">Initial value of the createdon property.</param>
        public static ShoutBox CreateShoutBox(global::System.Guid id, global::System.String message, global::System.DateTime createdon)
        {
            ShoutBox shoutBox = new ShoutBox();
            shoutBox.id = id;
            shoutBox.message = message;
            shoutBox.createdon = createdon;
            return shoutBox;
        }

        #endregion
        #region Primitive Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Guid id
        {
            get
            {
                return _id;
            }
            set
            {
                if (_id != value)
                {
                    OnidChanging(value);
                    ReportPropertyChanging("id");
                    _id = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("id");
                    OnidChanged();
                }
            }
        }
        private global::System.Guid _id;
        partial void OnidChanging(global::System.Guid value);
        partial void OnidChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String username
        {
            get
            {
                return _username;
            }
            set
            {
                OnusernameChanging(value);
                ReportPropertyChanging("username");
                _username = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("username");
                OnusernameChanged();
            }
        }
        private global::System.String _username;
        partial void OnusernameChanging(global::System.String value);
        partial void OnusernameChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String message
        {
            get
            {
                return _message;
            }
            set
            {
                OnmessageChanging(value);
                ReportPropertyChanging("message");
                _message = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("message");
                OnmessageChanged();
            }
        }
        private global::System.String _message;
        partial void OnmessageChanging(global::System.String value);
        partial void OnmessageChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.DateTime createdon
        {
            get
            {
                return _createdon;
            }
            set
            {
                OncreatedonChanging(value);
                ReportPropertyChanging("createdon");
                _createdon = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("createdon");
                OncreatedonChanged();
            }
        }
        private global::System.DateTime _createdon;
        partial void OncreatedonChanging(global::System.DateTime value);
        partial void OncreatedonChanged();

        #endregion
    
    }

    #endregion
    
}
