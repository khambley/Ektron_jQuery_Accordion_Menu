<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MenuView.aspx.cs" Inherits="Source_Templates_MenuView" %>

<%@ Register Assembly="Ektron.Cms.Framework.UI.Controls.EktronUI" Namespace="Ektron.Cms.Framework.UI.Controls.EktronUI" TagPrefix="ektronUI" %>

<%@ Register Assembly="Ektron.Cms.Framework.UI.Controls" Namespace="Ektron.Cms.Framework.UI.Controls.Views" TagPrefix="cc2" %>

<%@ Register Assembly="Ektron.Cms.Framework.UI.Controls" Namespace="Ektron.Cms.Framework.UI.Controls" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MenuView Control</title>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="../css/custom.css" />
    <script>
        $(function () {
            var icons = {
                header: "ui-icon-triangle-1-e",
                activeHeader: "ui-icon-triangle-1-s"
            };
            $("#uxMainMenu_menunav").accordion({
                icons: false,
                collapsible: true,
                heightStyle: "content",
                active: false
            });
            
            $("ul.subnav > li > ul > li").accordion({
                icons: icons,
                collapsible: true,
                heightStyle: "content",
                active: false
            });
            $("li.menuitem > a > span").removeClass("ui-accordion-header-icon");
            $("li.menuitem > a > span").removeClass("ui-icon");
            $("li.menuitem > a > span").removeClass("ui-icon-triangle-1-e");
            $("li.menuitem > a").removeClass("ui-accordion-header");
            $("li.menuitem > a").removeClass("ui-state-default");
            $("li.menuitem > a").removeClass("ui-state-hover");
            $('li.menuitem > a').click(function () {
                window.location = $(this).attr('href'); 
            });
        });
  </script>
</head>
<body>
    <form id="form1" runat="server">
            <div>
                <ektron:MenuModelSource ID="uxMenuModelSource" runat="server">
                    <TreeFilter Id="6" />
                </ektron:MenuModelSource>
                
                    <ektron:MenuView ID="uxMainMenu" runat="server" ModelSourceID="uxMenuModelSource">
                        <ListTemplate>
                            <ul id="menunav" runat="server" class="subnav">
                                <asp:PlaceHolder ID="listPlaceholder" runat="server" />
                            </ul>
                        </ListTemplate>
                        <ItemTemplate>
                            <li <%# ((Eval("Type").ToString().ToLower() == "submenu")) ? @" class=""subnav""" : @" class=""menuitem""" %>>
                                <asp:HyperLink ID="nodeLink" runat="server" Text='<%# Eval("Text") %>' NavigateUrl='<%# Eval("NavigateUrl") %>' />
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            </li>
                        </ItemTemplate>
                    </ektron:MenuView>
                
                
                
            </div>
        </form>
    </body>
</html>
