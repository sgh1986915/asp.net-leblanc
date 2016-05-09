<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="RobustHaven.Areas.VideoModule.Models" %>

<%=Html.Telerik()
	.TreeView()
	.Name("StoreTree")
	.ExpandAll(true)
	.ShowCheckBox(true)
	.ClientEvents(ev => ev.OnChecked("OnCameraChecked"))
	.BindTo((List<Store>)Model, mapping =>
	                            	{
	                            		mapping.For<Store>(binding => binding.ItemDataBound((item, store) =>
	                            		                                                    	{
	                            		                                                    		item.Text = store.storename;
	                            		                                                    		item.Value = string.Format("{0}_{1}", store.id.ToString(), "store");
	                            		                                                    	}).Children(store => store.VideoModuleCameras));
	                            		mapping.For<VideoModuleCamera>(binding => binding.ItemDataBound((item, camera) =>
	                            		                                                                	{
	                            		                                                                		item.Text = camera.Name;
	                            		                                                                		item.Value = string.Format("{0}_{1}", camera.ID.ToString(), "camera");
	                            		                                                                	}));
	                            	}) %>