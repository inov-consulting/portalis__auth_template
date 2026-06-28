<#macro resetFlowLayout step>
    <#assign LANG_CODE = "fr">
    <#if .locale??>
        <#assign LANG_CODE = .locale>
    </#if>
    <#if locale??>
        <#list locale.supported as supportedLocale>
            <#if supportedLocale.label == locale.current>
                <#if supportedLocale.url?contains("?kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after("?kc_locale=")[0..1]>
                </#if>
                <#if supportedLocale.url?contains("&kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after("&kc_locale=")[0..1]>
                </#if>
            </#if>
        </#list>
    </#if>

<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}" lang="${LANG_CODE}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <title>${realm.displayName!"PortaLis"} · ${msg("forgotPasswordTitle")}</title>
    <link rel="shortcut icon" href="${url.resourcesPath}/images/favicon.ico" type="image/png" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
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
</head>
<body class="bg-white">
  <div class="viewport">
    <div class="screen active" role="main" aria-label="Écran ${step} du processus de réinitialisation">
      <div class="split">
        <!-- Left - visible uniquement en desktop -->
        <div class="left hidden lg:flex lg:w-[40%] xl:w-[34%] p-8 lg:p-10 xl:p-12 xl:m-3 xl:rounded-xl">
          <!-- Decorative background glows -->
          <div class="absolute top-16 right-8 w-56 lg:w-72 h-56 lg:h-72 rounded-full pointer-events-none"
              style="background: radial-gradient(circle, rgba(3, 35, 19, 0.15), transparent);"></div>
          <div class="absolute bottom-20 left-4 w-80 lg:w-96 h-80 lg:h-96 rounded-full pointer-events-none"
              style="background: radial-gradient(circle, rgba(3, 35, 19, 0.15), transparent);"></div>
                    
          <div class="left-inner">
            <div class="logo-wrap">
              <img src="${url.resourcesPath}/images/portalis/logo_portalis.png" alt="PortaLis" class="h-16 lg:h-20 w-auto" />
            </div>

            <div class="left-body">
              <div class="left-tag">
                <span class="left-tag-dot"></span>
                <#if step == 1>
                  Réinitialisation sécurisée
                <#elseif step == 2>
                  Code envoyé avec succès
                <#else>
                  Identité vérifiée ✓
                </#if>
              </div>

              <#if step == 1>
                <h1 class="left-h1">Retrouvez <em>l'accès</em><br>à votre compte</h1>
                <p class="left-sub">Un code de vérification vous sera envoyé par email. La procédure prend moins de 2 minutes.</p>
              <#elseif step == 2>
                <h1 class="left-h1">Vérifiez<br>votre <em>identité</em></h1>
                <p class="left-sub">Un code à 6 chiffres a été envoyé à votre adresse email. Il expire dans 10 minutes.</p>
              <#else>
                <h1 class="left-h1">Dernière <em>étape</em><br>— sécurisez votre<br>compte</h1>
                <p class="left-sub">Choisissez un mot de passe fort. Toutes vos sessions actives seront déconnectées après la réinitialisation.</p>
              </#if>

              <div class="left-features">
                <#if step == 1>
                  <div class="feat">
                    <div class="feat-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0110 0v4"/></svg></div>
                    <span class="feat-text">Lien de vérification chiffré AES-256</span>
                  </div>
                  <div class="feat">
                    <div class="feat-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg></div>
                    <span class="feat-text">Code valable 10 minutes</span>
                  </div>
                  <div class="feat">
                    <div class="feat-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg></div>
                    <span class="feat-text">Envoyé sur votre adresse enregistrée</span>
                  </div>
                <#elseif step == 2>
                  <div class="feat">
                    <div class="feat-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg></div>
                    <span class="feat-text">Code valable <strong style="color:#fff">10 minutes</strong></span>
                  </div>
                  <div class="feat">
                    <div class="feat-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg></div>
                    <span class="feat-text">Vérifiez aussi vos spams</span>
                  </div>
                  <div class="feat">
                    <div class="feat-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="23 4 23 10 17 10"/><polyline points="1 20 1 14 7 14"/><path d="M3.51 9a9 9 0 0114.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0020.49 15"/></svg></div>
                    <span class="feat-text">Renvoi possible après expiration</span>
                  </div>
                <#else>
                  <div class="feat">
                    <div class="feat-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0110 0v4"/></svg></div>
                    <span class="feat-text">Chiffrement AES-256</span>
                  </div>
                  <div class="feat">
                    <div class="feat-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87"/><path d="M16 3.13a4 4 0 010 7.75"/></svg></div>
                    <span class="feat-text">Sessions existantes révoquées</span>
                  </div>
                  <div class="feat">
                    <div class="feat-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg></div>
                    <span class="feat-text">Politique de sécurité ANSSI</span>
                  </div>
                </#if>
              </div>
              <div class="relative z-10 text-[10px] lg:text-xs" style="color: rgba(245, 246, 244, 0.35);">
                © 2026 PortaLis · INOV Consulting
              </div>
            </div>
          </div>
        </div>

        <!-- Right - seule visible en mobile -->
        <div class="right w-full lg:w-[60%] xl:w-[66%]">
          <!-- Logo visible uniquement en mobile, au-dessus du formulaire -->
          <div class="lg:hidden text-center mb-8">
            <img src="${url.resourcesPath}/images/portalis/logo_portalis.png" alt="PortaLis" class="h-20 w-auto mx-auto mb-1" />
            <p class="text-gray-700 font-medium text-base mt-3">Pilotez votre activité transport</p>
          </div>
          
          <div class="form-box">
            <#nested "form">
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
</#macro>