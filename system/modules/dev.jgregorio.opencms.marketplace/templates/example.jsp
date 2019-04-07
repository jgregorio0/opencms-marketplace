<%@page buffer="none" session="false" import="org.opencms.jsp.CmsJspActionElement,org.opencms.file.*,org.opencms.main.*,java.text.DecimalFormat" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:setLocale value="${cms.locale}" />

<cms:bundle basename="com.saga.sagasuite.theme.ayto.malaga.principal.messages">

	<!DOCTYPE html>
	<%--
    El atributo 'googleShareHead' incluye el espacio de nombres de shcema.org para declarar el tipo de pagina.
    Lo usa Google+ para determinar el tipo de publicacion. Este atributos se carga en
    /system/modules/com.saga.sagasuite.core/templates/load-themeconfig.jsp (plantilla por defecto) con el tipo 'Article'
    en caso de vistas de detalle y 'Organization' en cualquier otra pagina
    --%>
	<html lang="${cms.locale}" ${googleShareHead}>
	<head>

		<title><cms:info property="opencms.title" /></title>
		<meta charset="${cms.requestContext.encoding}">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"><%-- Activamos para que Internet explorer muestra la página sin modo de compatibilidad en la versión exacta del navegador --%>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> <%-- Mantener proporciones partiendo del ancho del dispositivo donde se reproduce --%>
		<meta name="description" content="${descriptionpage }">
		<meta name="keywords" content="${keywordspage }">
		<meta name="robots" content="index, follow">
		<meta name="revisit-after" content="7 days">

			<%-- Incluimos el script de los Metas desde el loadconfig del sagasuite core o mediante property configurable en la pagina --%>
			${metas}
			<%-- fin de metas --%>
			<%-- Incluimos metas de todas las redes sociales (OpenGraph, Facebook, Twitter, Google+)--%>
			${socialMetas}
			<%-- fin de metas redes sociales --%>

			<%-- Inlcuimos script definido en la propiedad sagasuite.scripttag.afterMeta --%>
		<c:out value="${scriptTagAfterMeta}" escapeXml="false"/>


		<!-- BLOQUE: Stylesheets -->

		<cms:headincludes type="css" closetags="false" defaults="%(link.weak:/system/modules/com.saga.sagasuite.core.script/resources/bootstrap/datepicker/1.6.1/css/bootstrap-datepicker3.min.css:7ba8f0b1-4415-11e6-9634-7fb253176922)"/>

			<%-- Las versiones recientes de IE al no leer los condicionales cogen tambien esta css--%>
		<!--[if !IE]><!-->
		<c:if test="${empty skin }">
			<c:set var="defaultrutacss" value="/system/modules/${theme}/skins/skin-default/css/screen.css" />
			<link rel="stylesheet" type="text/css" href="<cms:link>/system/modules/${theme}/skins/skin-default/css/screen.css</cms:link>?v=${cms.vfs.resource[defaultrutacss].version}" />
		</c:if>
		<c:if test="${not empty skin}">
			<c:set var="skintrutacss" value="/system/modules/${theme}/skins/${skin}/css/screen.css" />
			<link rel="stylesheet" type="text/css" href="<cms:link>/system/modules/${theme}/skins/${skin}/css/screen.css</cms:link>?v=${cms.vfs.resource[skintrutacss].version}" />
		</c:if>
		<!--<![endif]-->

			<%-- Especifico para versiones antiguas de IE que leen los condicionales --%>
		<!--[if lte IE 9]>
		<c:if test="${empty skin }">
			<c:set var="iedefaultrutabscss" value="/system/modules/${theme}/skins/skin-default/css/screen-bootstrap-for-ie.css" />
			<c:set var="iedefaultrutasagacss" value="/system/modules/${theme}/skins/skin-default/css/screen-saga-for-ie.css" />
			<link rel="stylesheet" type="text/css" href="<cms:link>/system/modules/${theme}/skins/skin-default/css/screen-bootstrap-for-ie.css</cms:link>?v=${cms.vfs.resource[iedefaultrutabscss].version}" />
			<link rel="stylesheet" type="text/css" href="<cms:link>/system/modules/${theme}/skins/skin-default/css/screen-saga-for-ie.css</cms:link>?v=${cms.vfs.resource[iedefaultrutasagacss].version}" />
		</c:if>
		<c:if test="${not empty skin }">
			<c:set var="ieskinrutabscss" value="/system/modules/${theme}/skins/${skin}/css/screen-bootstrap-for-ie.css" />
			<c:set var="ieskinrutasagacss" value="/system/modules/${theme}/skins/${skin}/css/screen-saga-for-ie.css" />
			<link rel="stylesheet" type="text/css" href="<cms:link>/system/modules/${theme}/skins/${skin}/css/screen-bootstrap-for-ie.css</cms:link>?v=${cms.vfs.resource[ieskinrutabscss].version}" />
			<link rel="stylesheet" type="text/css" href="<cms:link>/system/modules/${theme}/skins/${skin}/css/screen-saga-for-ie.css</cms:link>?v=${cms.vfs.resource[ieskinrutasagacss].version}" />
		</c:if>
		<![endif]-->

			<%-- Cargamos la css custom definida por properties --%>

		<c:if test="${not empty csscustom}">
			<link rel="stylesheet" type="text/css" href="<cms:link>${csscustom}</cms:link>" />
		</c:if>


		<!-- FIN BLOQUE: Stylesheets -->


		<!-- BLOQUE: JavaScript -->

		<script src="<cms:link>/system/modules/com.saga.sagasuite.core.script/resources/jquery/1.10.2/jquery-1.10.2.min.js</cms:link>" type="text/javascript" ></script>
			<%-- Bootstrap js--%>
		<script src="<cms:link>/system/modules/com.saga.sagasuite.theme.ayto.malaga.principal/resources/js/bootstrap.min.js</cms:link>" type="text/javascript" ></script>

			<%-- perfect scrollbar plugin--%>
		<script src="<cms:link>/system/modules/com.saga.sagasuite.core.script/resources/perfect-scrollbar/0.6.7/js/min/perfect-scrollbar.jquery.min.js</cms:link>" type="text/javascript" ></script>
		<%-- Comentado a instancia de CEMI - Incidencia Mantis #9484 --%>
		<%-- addthis script (insertar aqui el pubid correspondiente)--%>
		<%--<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5241316031c8d72d"></script>--%>

		<c:if test="${cms.requestContext.currentProject.onlineProject}">
			<script src="<cms:link>/system/modules/com.saga.sagasuite.core.script/resources/tinymce/4.1.7/tinymce.min.js</cms:link>" type="text/javascript"></script>
		</c:if>

			<%-- Incluimos el script de recaptcha --%>
		<script src="https://www.google.com/recaptcha/api.js" async="async" defer="defer"></script>
			<%-- traductor de Google --%>
		<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

			<%-- Incluimos el script de analytics desde el loadconfig del sagasuite core o mediante property configurable en la pagina --%>
		<c:if test="${not empty analytics}">
			${analytics}
		</c:if>

			<%-- fin de analytics --%>

			<%-- FIN BLOQUE: JavaScript --%>

			<%-- Locale y editable --%>

		<c:if test="${multilocale }">

		</c:if>

			<%-- Controlamos que la pagina sea editable o no a traves de la property de editable --%>
		<c:if test="${empty edit || edit=='true'}">
			<cms:enable-ade/>
		</c:if>

			<%-- Fav and touch icons --%>
		<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
		<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
		<link rel="manifest" href="/manifest.json">
		<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
		<meta name="theme-color" content="#ffffff">

			<%-- Inlcuimos script definido en la propiedad sagasuite.scripttag.endHead --%>
		<c:out value="${scriptTagEndHead}" escapeXml="false"/>

	</head>

	<!-- FIN HEAD -->

	<body class="${pagecssclass }<c:if test="${pagebg == 'pagebgtrue' }"> bg-image-body</c:if><c:if test="${pagebox == 'pageboxtrue' }"> body-boxed</c:if><cms:device type="desktop"> desktop-device</cms:device><cms:device type="tablet"> responsive-device tablet-device</cms:device><cms:device type="mobile"> responsive-device mobile-device</cms:device>">

		<%-- Inlcuimos script definido en la propiedad sagasuite.scripttag.startBody --%>
	<c:out value="${scriptTagStartBody}" escapeXml="false"/>

		<%-- Comentamos este include porque en este portal se usará un plugin de terceros (Addthis) para compartir contenido

        <cms:include file="/system/modules/com.saga.sagasuite.share/elements/sgfacebook-init-script.jsp"/>--%>

		<%-- Si la property de "h1coulto" está a true se carga un h1 solo visible para lectores de pantalla y robots con la propiedad title de la página --%>
	<c:set var="h1oculto">
		<cms:property name="sagasuite.h1oculto" file="search" />
	</c:set>

	<c:if test="${h1oculto == 'true'}">
		<h1 class="sr-only"><cms:info property="opencms.title" /></h1>
	</c:if>

	<!-- Accesibilidad accesos directos bloques de la pagina y a páginas habituales de access keys -->
	<nav class="sr-only">
		<ul>
			<li>
				<a href="#content-interior" class="sr-only" accesskey="s"><fmt:message key="label.access.jump.content"/></a>
			</li>
			<li>
				<a href="#header" class="sr-only" accesskey="c"><fmt:message key="label.access.jump.header"/></a>
			</li>
			<li>
				<a href="#footer" class="sr-only" accesskey="p"><fmt:message key="label.access.jump.footer"/></a>
			</li>
			<li>
				<a href="#navmain" class="sr-only" accesskey="u"><fmt:message key="label.access.jump.menu"/></a>
			</li>
		</ul>
	</nav>
	<c:if test="${not cms.requestContext.currentProject.onlineProject}">
		<%-- Placeholder for OpenCms toolbar in the offline project --%>
		<div style="background: lightgray; height: 52px" class="toolbar-offline-space">&nbsp;</div>
	</c:if>
	<div id="page" class="page-interior">
			<%-- Header  --%>
		<c:set var="headerlink"><cms:link>${themeConfiguration.CustomFieldKeyValue.header}</cms:link></c:set>
		<div id="header">
			<div class="wrapper">
				<cms:display value="${headerlink}" editable="true">
					<cms:displayFormatter type="sgmainnavigation" path="/system/modules/com.saga.sagasuite.theme.ayto.malaga.principal/formatters/sgmainnavigation-formatter-config.xml" />
				</cms:display>
			</div>
		</div>
			<%-- End Main Header --%>

			<%-- Main Page Content and Sidebar --%>
		<div id="content-interior" class="content content-interior">
			<div class="main-content">
				<div class="wrapper">
					<div class="detalle">
						<cms:container name="wrapper-container" type="page" width="1200"  maxElements="10" editableby="ROLE.DEVELOPER">
							<div class="alert pt-40 pb-40 alert-info">
								<h1 class="no-margin">
									<strong>Container principal de la página</strong>
								</h1>
								<div>
									Arrastra aquí los recursos de tipo template row para empezar a construir la página.
								</div>
							</div>
						</cms:container>
					</div>
				</div>
			</div>
		</div>

		<footer id="footer">
			<c:set var="leftfooterlink"><cms:link>${themeConfiguration.CustomFieldKeyValue.leftfooter}</cms:link></c:set>
			<c:set var="rightfooterlink"><cms:link>${themeConfiguration.CustomFieldKeyValue.rightfooter}</cms:link></c:set>
			<c:set var="copyrightlink"><cms:link>${themeConfiguration.CustomFieldKeyValue.copyright}</cms:link></c:set>

				<%-- Footer sup --%>
			<div class="container footer-sup mb-60">
				<div class="row">
					<div class="col-sm-6 footer-sup-left">
						<cms:display value="${leftfooterlink}">
							<cms:displayFormatter type="sgfreehtml" path="/system/modules/com.saga.sagasuite.theme.ayto.malaga.principal/formatters/freehtml.xml" />
						</cms:display>
					</div>
					<div class="col-sm-6 footer-sup-right">
						<cms:display value="${rightfooterlink}">
							<cms:displayFormatter type="sgfreehtml" path="/system/modules/com.saga.sagasuite.theme.ayto.malaga.principal/formatters/freehtml.xml" />
						</cms:display>
					</div>
				</div>
			</div>
				<%-- Copyright --%>
			<div class="container copyright">
				<cms:display value="${copyrightlink}">
					<cms:displayFormatter type="sgfreehtml" path="/system/modules/com.saga.sagasuite.theme.ayto.malaga.principal/formatters/freehtml.xml" />
				</cms:display>
			</div>
		</footer>
		<%-- Comentado a instancia de CEMI - Incidencia Mantis #9484 --%>
		<%-- AddThis Button BEGIN --%>
		<%--<div class="addthis_toolbox addthis_default_style addthis_32x32_style clearfix">
			<a class="addthis_button_compact"></a>
			<a class="addthis_button_print"></a>
		</div>--%>
		<%-- Comentado a instancias del CEMI - Incidencia #9442 --%>
		<%-- Read Speaker - por js lo movemos al bloque de contenido principal (si existe) --%>
		<%--<cms:include file="/system/modules/com.saga.sagasuite.theme.ayto.malaga.principal/functions/fn-read-speaker.jsp" />--%>
	</div><%-- /.page --%>

		<%-- End Content -->
        <%-- End Main Content --%>
		<%-- BLOQUE: JavaScript --%>
	<%-- Comentado a instancias del CEMI - Incidencia #9442 --%>
	<%--<script src="//f1-eu.readspeaker.com/script/9453/ReadSpeaker.js?pids=embhl" type="text/javascript"></script>--%>

	<cms:headincludes type="javascript" defaults="%(link.weak:/system/modules/com.saga.sagasuite.core.script/resources/magnific-popup/1.1.0/js/jquery.magnific-popup.min.js:af29c0df-06f2-11e6-8cce-7fb253176922)
	|%(link.weak:/system/modules/com.saga.sagasuite.core.script/resources/sagasuite/equal-height-boxes-dynamic.js:b50ade9f-cb9a-11e7-918b-7fb253176922)
	|%(link.weak:/system/modules/com.saga.sagasuite.core.script/resources/holder/2.3.1/holder.min.js:13e5e548-fc55-11e3-a209-f18cf451b707)
	|%(link.weak:/system/modules/com.saga.sagasuite.core.script/resources/jquery.validate/1.13.1/jquery.validate-1.13.1.min.js:97ebf687-c8ca-11e4-b15d-01e4df46f753)
	|%(link.weak:/system/modules/com.saga.sagasuite.core.script/resources/bootstrap/datepicker/1.6.1/js/bootstrap-datepicker.min.js:7bd77ad6-4415-11e6-9634-7fb253176922)
	|%(link.weak:/system/modules/com.saga.sagasuite.theme.ayto.malaga.principal/resources/js/theme.js:33b512a2-aa4c-11e6-86fe-add3730e3313)" />
		<%-- datepicker locale --%>
	<script src="<cms:link>/system/modules/com.saga.sagasuite.core.script/resources/bootstrap/datepicker/1.6.1/locales/bootstrap-datepicker.${cms.locale}.min.js</cms:link>" type="text/javascript" ></script>
		<%-- Cargamos el js custom definida por properties --%>
	<c:if test="${not empty jscustom}">
		<script src="<cms:link>${jscustom}</cms:link>" type="text/javascript" ></script>
	</c:if>

		<%-- Cargamos el js especifico para IE --%>
	<!--[if lt IE 9]>
	<script src="<cms:link>/system/modules/com.saga.sagasuite.core.script/resources/html5shiv/3.0/html5shiv.js</cms:link>" type="text/javascript" ></script>
	<script src="<cms:link>/system/modules/com.saga.sagasuite.core.script/resources/respond/1.3.0/respond.js</cms:link>" type="text/javascript" ></script>
	<script src="<cms:link>/system/modules/com.saga.sagasuite.core.script/resources/sagasuite/sg-ie7-8.js</cms:link>" type="text/javascript" ></script>
	<![endif]-->

		<%-- Inlcuimos script definido en la propiedad sagasuite.scripttag.endBody --%>
	<c:out value="${scriptTagEndBody}" escapeXml="false"/>

	<%-- Comentado a instancia de CEMI - Incidencia Mantis #9484 --%>
	<%-- addthis track address bar --%>
	<%--<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>--%>

		<%-- Modal de avisos que se muestra solo en la home cuando se selecciona la propiedad de 'activar aviso home'--%>
	<c:set var="contentmodalhomelink"><cms:link>${themeConfiguration.CustomFieldKeyValue.contentmodalhome}</cms:link></c:set>
	<c:set var="modalactive"><cms:property name="aytomalaga.modalactive" file="search" /></c:set>
	<c:if test="${not empty contentmodalhomelink and modalactive == 'true'}">
		<div class="modal fade" tabindex="-1" role="dialog" id="modalavisoshome">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="pe-7s-close" aria-hidden="true"></span></button>
					</div>
					<div class="modal-body">
						<div class="media">
							<div class="media-left">
								<span class="pe-7s-info media-object fs50" aria-hidden="true"></span>
							</div>
							<div class="media-body">
								<cms:display value="${contentmodalhomelink}">
									<cms:displayFormatter type="sgmicrocontentpanel" path="/system/modules/com.saga.sagasuite.theme.ayto.malaga.principal/formatters/microcontentpanel.xml" />
								</cms:display>
							</div>
						</div>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		<script type="text/javascript">
			$(document).ready(function () {
				$('#modalavisoshome').modal();
			});
		</script>
	</c:if>
	</body>

	</html>

</cms:bundle>