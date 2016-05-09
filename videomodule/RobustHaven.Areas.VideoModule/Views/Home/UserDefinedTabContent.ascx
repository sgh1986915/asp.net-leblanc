<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="RobustHaven.Areas.VideoModule.Models" %>

<%=Html.Telerik()
	.TreeView()
	.Name("StoreTree")
	.ExpandAll(true)
	.ShowCheckBox(true)
	.BindTo((List<VideoModuleUserCameraPreset>)Model, mapping =>
	                            	{
	                            		mapping.For<VideoModuleUserCameraPreset>(binding => binding.ItemDataBound((item, preset) =>
	                            		                                                    	{
	                            		                                                    		item.Text = preset.Name;
	                            		                                                    		item.Value = string.Format("{0}_{1}", preset.ID.ToString(), "preset");
	                            		                                                    	}).Children(store => store.VideoModuleUser_Camera));
	                            		mapping.For<VideoModuleUser_Camera>(binding => binding.ItemDataBound((item, camera) =>
	                            		                                                                	{
	                            		                                                                		item.Text = camera.VideoModuleCamera.Name;
	                            		                                                                		item.Value = string.Format("{0}_{1}", camera.VideoModuleCamera.ID.ToString(), "camera");
	                            		                                                                	}));
	                            	}) %>