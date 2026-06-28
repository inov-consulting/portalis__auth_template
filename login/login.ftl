<#import "template_login.ftl" as layout>
<#import "components/atoms/button.ftl" as button>
<#import "components/atoms/button-group.ftl" as buttonGroup>
<#import "components/atoms/checkbox.ftl" as checkbox>
<#import "components/atoms/form.ftl" as form>
<#import "components/atoms/input.ftl" as input>
<#import "components/atoms/link.ftl" as link>
<#import "components/molecules/identity-provider.ftl" as identityProvider>

<@layout.registrationLayout displayInfo=((social?? && social.displayInfo??)?then(social.displayInfo,false)) && realm.password && realm.registrationAllowed && !registrationDisabled??; section>


    <#if section = "title">
        ${msg("loginHeading",(realm.displayName!''))}
    <#elseif section = "form">

        <h2 class="font-bold text-3xl text-gray-900 mb-1">${msg("loginHeading")}</h2>
        <p class="text-sm mb-8" style="color:#9ca3af;">${msg("loginSubtitle")}</p>

        <#-- Determine if there are field errors -->
        <#assign hasFieldError = messagesPerField.existsError('username','password')>

        <form id="kc-form-login" action="${url.loginAction}" method="post"
              onsubmit="portalIsSubmit(this)">

            <!-- Email / Username field -->
            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700 mb-1.5">
                    <#if realm.loginWithEmailAllowed && realm.registrationEmailAsUsername>
                        ${msg("email")}
                    <#elseif !realm.loginWithEmailAllowed>
                        ${msg("username")}
                    <#else>
                        ${msg("usernameOrEmail")}
                    </#if>
                </label>
                <div class="relative">
                    <span class="absolute left-3 top-1/2 -translate-y-1/2 pointer-events-none" style="color:#9ca3af;">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24"
                             stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
                        </svg>
                    </span>

                    <#assign usernameInputClass = "w-full pl-9 pr-3 py-2.5 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-700 focus:border-transparent bg-white " + (hasFieldError?then("border border-red-400 text-red-600", "border border-gray-300 text-gray-700"))>

                    <#if realm.loginWithEmailAllowed && realm.registrationEmailAsUsername>
                        <#if usernameEditDisabled??>
                            <input type="email" name="username"
                                   value="${(login.username!'')}"
                                   class="${usernameInputClass}"
                                   readonly />
                        <#else>
                            <input type="email" name="username"
                                   value="${(login.username!'')}"
                                   class="${usernameInputClass}"
                                   placeholder="vous@portalis.com"
                                   autofocus autocomplete="email" />
                        </#if>
                    <#elseif !realm.loginWithEmailAllowed>
                        <#if usernameEditDisabled??>
                            <input type="text" name="username"
                                   value="${(login.username!'')}"
                                   class="${usernameInputClass}"
                                   readonly />
                        <#else>
                            <input type="text" name="username"
                                   value="${(login.username!'')}"
                                   class="${usernameInputClass}"
                                   autofocus autocomplete="username" />
                        </#if>
                    <#else>
                        <#if usernameEditDisabled??>
                            <input type="text" name="username" id="username"
                                   value="${(login.username!'')}"
                                   class="${usernameInputClass}"
                                   readonly />
                        <#else>
                            <input type="text" name="username" id="username"
                                   value="${(login.username!'')}"
                                   class="${usernameInputClass}"
                                   placeholder="vous@portalis.com"
                                   autofocus autocomplete="off" />
                        </#if>
                    </#if>
                </div>
            </div>

            <!-- Password field -->
            <div class="mb-3">
                <label class="block text-sm font-medium text-gray-700 mb-1.5">${msg("password")}</label>
                <div class="pwd-wrapper">
                    <input id="password" name="password" type="password"
                           class="w-full pl-3 py-2.5 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-700 focus:border-transparent bg-white ${hasFieldError?then("border border-red-400 text-red-600", "border border-gray-300 text-gray-700")}"
                           autocomplete="current-password" />
                </div>
            </div>

            <!-- Field error message -->
            <#if hasFieldError>
                <p class="text-sm mb-4" style="color:#ef4444;" aria-live="polite">
                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                </p>
            </#if>

            <!-- Non-field success message -->
            <#if message?has_content && (message.type == "success")>
                <div class="flex items-center gap-2 p-3 mb-4 text-sm rounded-lg" style="color:#15803d; background:#f0fdf4;">
                    <svg class="w-4 h-4 shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
                    </svg>
                    <span>${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>

            <!-- Non-field error message (account locked, too many attempts, etc.) -->
            <#if message?has_content && (message.type == "error") && !hasFieldError>
                <div class="flex items-center gap-2 p-3 mb-4 text-sm rounded-lg" style="color:#b91c1c; background:#fef2f2;">
                    <svg class="w-4 h-4 shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
                    </svg>
                    <span>${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>

            <!-- Remember me + forgot password -->
            <div class="flex items-center justify-between mb-6">
                <#if realm.rememberMe && !usernameEditDisabled??>
                    <label class="flex items-center gap-2 cursor-pointer select-none">
                        <input type="checkbox" name="rememberMe"
                               class="w-4 h-4 rounded border-gray-300 focus:ring-blue-500"
                               style="accent-color: #077c34;"
                               <#if login.rememberMe??>checked</#if> />
                        <span class="text-sm text-gray-600">${msg("rememberMe")}</span>
                    </label>
                <#else>
                    <span></span>
                </#if>
                <#if realm.resetPasswordAllowed>
                    <a href="${url.loginResetCredentialsUrl}"
                       class="text-sm font-medium" style="color:#1B6B45;"
                       onmouseover="this.style.color='#8B6914'" onmouseout="this.style.color='#7A5A0A'">
                        ${msg("doForgotPassword")}
                    </a>
                </#if>
            </div>

            <!-- Submit button -->
            <button id="kc-login" type="submit"
                    class="w-full text-white font-semibold py-2.5 px-4 rounded-lg text-sm transition-colors"
                    style="background:#1B6B45;"
                    onmouseover="if(!this.disabled)this.style.background='#1B6B45'"
                    onmouseout="if(!this.disabled)this.style.background='#166239'">
                <span id="portalis-btn-text">${msg("doLogIn")}</span>
                <span id="portalis-btn-spinner" class="hidden justify-center items-center">
                    <svg class="animate-spin w-5 h-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                        <path class="opacity-75" fill="currentColor"
                              d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                </span>
            </button>

            <!-- Session expiry notice -->
            <!-- <p class="text-center text-xs mt-4" style="color:#9ca3af;">${msg("sessionExpireNotice")}</p> -->

            <!-- Registration link -->
            <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                <p class="text-center text-sm text-gray-500 mt-4">
                    ${msg("noEsigmapAccount")}
                    <a class="font-medium underline" style="color:#2563eb;" href="${url.registrationUrl}">${msg("registerLink")}</a>
                </p>
            </#if>

            <!-- Social providers -->
            <!-- <#if realm.password && social.providers??>
                <div class="mt-4 text-sm text-gray-500">
                    <@identityProvider.kw providers=social.providers />
                </div>
            </#if> -->
        </form>

        <script>
        function portalIsSubmit(form) {
            var btn = document.getElementById('kc-login');
            var txt = document.getElementById('portalis-btn-text');
            var spin = document.getElementById('portalis-btn-spinner');
            if (btn && txt && spin) {
                txt.classList.add('hidden');
                spin.classList.remove('hidden');
                spin.classList.add('flex');
                btn.disabled = true;
                btn.style.background = '#1B6B45';
                btn.style.opacity = '0.85';
            }
        }
        </script>

    </#if>
</@layout.registrationLayout>
