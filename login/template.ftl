<#import "components/molecules/locale-provider.ftl" as localeProvider>
<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
    <!DOCTYPE html>

    <#-- Attempt to reverse-engineer code for page’s current language, as Keycloak does not currently make this available -->
    <#assign LANG_CODE = "fr">
    <#if .locale??>
        <#assign LANG_CODE = .locale>
    </#if>
    <#if locale??>
        <#list locale.supported>
            <#items as supportedLocale>
                <#if supportedLocale.label == locale.current>
                    <#if supportedLocale.url?contains("?kc_locale=")>
                        <#assign LANG_CODE = supportedLocale.url?keep_after("?kc_locale=")[0..1]>
                    </#if>
                    <#if supportedLocale.url?contains("&kc_locale=")>
                        <#assign LANG_CODE = supportedLocale.url?keep_after("&kc_locale=")[0..1]>
                    </#if>
                </#if>
            </#items>
        </#list>
    </#if>

    <!--[if lt IE 9]>
    <html class="lte-ie8 ${properties.kcHtmlClass!}" lang="${LANG_CODE}"><![endif]-->
    <!--[if gt IE 8]><!-->
    <html class="${properties.kcHtmlClass!}" lang="${LANG_CODE}"><!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">

        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}" />
            </#list>
        </#if>
        <title><#nested "title"> - ${realm.displayName!'PortaLis'}</title>

        <link rel="shortcut icon" href="${url.resourcesPath}/images/favicon.png" type="image/png" />

        <link rel="apple-touch-icon-precomposed" sizes="152x152"
              href="${url.resourcesPath}/images/logotype/apple-touch-icon-ipad-retina-152x152.png?.0.1.0">
        <link rel="apple-touch-icon-precomposed" sizes="60x60"
              href="${url.resourcesPath}/images/logotype/apple-touch-icon-iphone-60x60.png?.0.1.0">
        <link rel="apple-touch-icon-precomposed" sizes="120x120"
            href="${url.resourcesPath}/images/logotype/apple-touch-icon-iphone-retina-120x120.png?.0.1.0">


        <meta name="viewport" content="width=device-width, initial-scale=1">

        <#-- End Holisticon Template <head> content -->


        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>

    </head>
    <body class="bg-white h-screen m-0 p-0">
      <div class="h-screen mx-auto w-full">
          <div class="mx-0 md:mx-auto flex lg:justify-center gap-0 flex-col lg:flex-row max-[770px] h-screen font-display">
              <!-- Section gauche - Formulaire -->
              <div class="w-full h-full lg:w-6/12 bg-white py-5 lg:px-[100px]  lg:px-[180px] sm:px-[80px] md:px-[100px] px-[50px] content-center">
                  <!-- Navigation et langue en haut -->
                  <div class="flex items-end justify-between gap-3 mt-2 md:mt-2">
                      <#nested "back">
                      <span></span>
                      <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                          <@localeProvider.kw currentLocale=locale.current locales=locale.supported />
                      </#if>
                  </div>
                  
                  <!-- Header avec logo PortaLis -->
                  <div class="flex items-center justify-center gap-3 mt-2 md:mt-2">
                      <div class="flex items-center gap-4 md:gap-4 lg:gap-3">
                          <img src="${url.resourcesPath}/images/portalis/logo_portalis.png" class="logo w-38 md:w-32 lg:w-38 xl:w-40"/>
                      </div>
                  </div>

                  <!-- Contenu du formulaire -->
                  <#nested "form">
              </div>

              <!-- Section droite - Image de fond -->
              <div class="w-full lg:w-6/12 bg-white text-gray-600 flex flex-col justify-center items-center relative">
                  <div class="relative min-h-[50px] md:min-h-[400px] lg:min-h-[400px] w-full h-full flex items-center justify-center bg-[#A8C4B2] bg-[url('${url.resourcesPath}/images/login_locker.png')] bg-cover bg-center">
                  </div>
              </div>
          </div>
      </div>
    </body>
</html>

</#macro>
