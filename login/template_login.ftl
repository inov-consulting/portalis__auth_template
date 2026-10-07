<#import "components/molecules/locale-provider.ftl" as localeProvider>
<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
    <!DOCTYPE html>

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

        <link rel="shortcut icon" href="${url.resourcesPath}/images/favicon.ico" type="image/ico" />

        <meta name="viewport" content="width=device-width, initial-scale=1">

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

    <body class="bg-white m-0 p-0 min-h-screen">
        <div class="flex min-h-screen">

            <!-- Left panel: dark gradient with branding and features -->
            <div class="hidden lg:flex lg:w-[40%] xl:w-[34%] flex-col justify-between p-8 lg:p-10 xl:p-12 relative overflow-hidden xl:m-3 xl:rounded-xl"
                style="background: linear-gradient(160deg, #1B6B45 0%, #166239 50%, #8B6914 100%);">

                <!-- Decorative background glows -->
                <div class="absolute top-16 right-8 w-56 lg:w-72 h-56 lg:h-72 rounded-full pointer-events-none"
                    style="background: radial-gradient(circle, rgba(3, 35, 19, 0.15), transparent);"></div>
                <div class="absolute bottom-20 left-4 w-80 lg:w-96 h-80 lg:h-96 rounded-full pointer-events-none"
                    style="background: radial-gradient(circle, rgba(3, 35, 19, 0.15), transparent);"></div>

                <!-- Logo -->
                <div class="relative z-10">
                    <div class="inline-block rounded-xl px-2 py-1 bg-white border border-gray-200">
                        <img src="${url.resourcesPath}/images/portalis/logo_portalis.png" alt="PortaLis" class="h-16 lg:h-20 w-auto" />
                    </div>
                </div>

                <!-- Main headline + features -->
                <div class="relative z-10 flex-1 flex flex-col justify-center py-5">
                    <h1 class="text-white font-bold text-3xl lg:text-4xl xl:text-[2.4rem] leading-tight mb-4">
                        Pilotez votre activité transport en temps réel
                    </h1>
                    <p class="text-orange-300 text-sm lg:text-base mb-8 lg:mb-10" style="opacity: 0.75;">
                        Agents IA · Multi-entités · Sénégal &amp; Côte d'Ivoire
                    </p>

                    <div class="flex flex-col gap-2.5 lg:gap-3">
                        <div class="flex items-center gap-2 lg:gap-2.5 w-fit rounded-full px-3 lg:px-4 py-1.5 lg:py-2 text-white text-xs lg:text-sm"
                            style="border: 1px solid rgba(147, 253, 156, 0.25); background: rgba(255,255,255,0.05);">
                            <span class="text-green-300 text-xs">✦</span>
                            Pipeline commercial tracé
                        </div>
                        <div class="flex items-center gap-2 lg:gap-2.5 w-fit rounded-full px-3 lg:px-4 py-1.5 lg:py-2 text-white text-xs lg:text-sm"
                            style="border: 1px solid rgba(147, 253, 156, 0.25); background: rgba(255,255,255,0.05);">
                            <span class="text-green-300 text-xs">✦</span>
                            Dossiers transport en temps réel
                        </div>
                        <div class="flex items-center gap-2 lg:gap-2.5 w-fit rounded-full px-3 lg:px-4 py-1.5 lg:py-2 text-white text-xs lg:text-sm"
                            style="border: 1px solid rgba(147, 253, 156, 0.25); background: rgba(255,255,255,0.05);">
                            <span class="text-green-300 text-xs">✦</span>
                            Agent DAF IA supervisé
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <div class="relative z-10 text-[10px] lg:text-xs" style="color: rgba(245, 246, 244, 0.35);">
                    © 2026 PortaLis · INOV Consulting
                </div>
            </div>

            <!-- Right panel: login form -->
            <div class="w-full lg:flex-1 flex flex-col min-h-screen bg-white">

                <!-- Session-expired / warning banner -->
                <#if message?has_content && (message.type == "warning")>
                    <div class="w-full px-6 py-3" style="background:#fff7ed; border-bottom: 1px solid #fed7aa;">
                        <p class="text-center text-sm font-medium" style="color:#ea580c;">
                            ${kcSanitize(message.summary)?no_esc}
                        </p>
                    </div>
                </#if>

                <!-- Locale selector -->
                <#if realm.internationalizationEnabled && locale?? && locale.supported?size gt 1>
                    <div class="flex justify-end px-6 pt-4">
                        <@localeProvider.kw currentLocale=locale.current locales=locale.supported />
                    </div>
                </#if>

                <!-- Centered form area -->
                <div class="flex-1 flex flex-col justify-center items-center px-6 sm:px-10 lg:px-12 xl:px-16 py-8">

                    <!-- Mobile-only logo -->
                    <div class="lg:hidden text-center mb-8">
                        <img src="${url.resourcesPath}/images/portalis/logo_portalis.png" alt="PortaLis" class="h-20 w-auto mx-auto mb-1" />
                        <p class="text-gray-700 font-medium text-base mt-3">Pilotez votre activité transport</p>
                    </div>

                    <!-- Form card (card on mobile, flat on desktop) -->
                    <div class="w-full max-w-sm lg:max-w-md bg-white lg:bg-transparent rounded-2xl lg:rounded-none shadow-xl lg:shadow-none p-8 lg:p-0">
                        <#nested "form">
                    </div>
                </div>
            </div>

        </div>
    </body>
    </html>
</#macro>
