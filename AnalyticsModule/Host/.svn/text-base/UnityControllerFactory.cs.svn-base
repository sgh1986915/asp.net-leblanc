using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Compilation;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.Practices.Unity;

namespace MvcApplication1
{
	public class UnityControllerFactory : DefaultControllerFactory
	{
		private readonly IUnityContainer _container;

		public UnityControllerFactory(IUnityContainer container)
		{
			_container = container;

			Func<Type, bool> isController =
				(type) => typeof (IController).IsAssignableFrom(type)
				          && (type.IsAbstract || type.IsInterface
				              || type.GetCustomAttributes(typeof (GeneratedCodeAttribute), true).Any()) != true;


			foreach (Assembly assembly in BuildManager.GetReferencedAssemblies())
			{
				try
				{
					Type[] types = assembly.GetTypes();

					// Also register all controllers
					IEnumerable<Type> controllerTypes = from t in types
					                                    where isController(t)
					                                    select t;


					foreach (Type t in controllerTypes)
					{
						_container.RegisterType(t);
					}
				}
				catch
				{
				}
			}
		}


		protected override IController GetControllerInstance(RequestContext requestContext, Type controllerType)
		{
			if (controllerType != null)
			{
				var controller = _container.Resolve(controllerType) as IController;

				if (controller == null)
				{
					return base.GetControllerInstance(requestContext, controllerType);
				}

				return controller;
			}


			throw new HttpException((Int32) HttpStatusCode.NotFound,
			                        String.Format(
			                        	"The controller for path '{0}' could not be found or it does not implement IController.",
			                        	requestContext.HttpContext.Request.Path)
				);
		}
	}
}