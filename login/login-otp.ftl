<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginTitle",realm.displayName)}
    <#elseif section = "header">
        ${msg("loginTitleHtml",realm.displayNameHtml)?no_esc}
    <#elseif section = "form">
      <h2 class="py-2 text-2xl mt-5 text-gray-800">${msg("loginTotpOneTime")}</h2>
      <p class="text-gray-700 text-sm">
          ${msg("loginTotpStep3")}
      </p>
        <#if messagesPerField.existsError('totp')>
          <span  class="text-red-800 position: absolute text-xs" aria-live="polite">
                  ${kcSanitize(messagesPerField.get('totp'))?no_esc}
              </span>
        </#if>
        <form id="kc-totp-login-form" action="${url.loginAction}" method="post">
          <div class="py-3">
            <input id="totp" name="otp" data-qa="otp" autocomplete="off" type="hidden" class="holi-input-field" autofocus placeholder="${msg("loginTotpOneTime")}" />
            <div class="py-8 flex justify-center">
              <div id="otp" class="flex flex-row justify-center text-center px-2 mt-5">
                <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="first" maxlength="1" />
                <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="second" maxlength="1" />
                <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="third" maxlength="1" />
                <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="fourth" maxlength="1" />
                <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="fifth" maxlength="1" />
                <input class="m-2 border h-10 w-10 text-center form-control rounded" type="text" id="sixth" maxlength="1" />
              </div>

            </div>
          </div>
          <div class="py-3">
            <button  type="submit"
                     name="login" id="kc-login"
                     class="w-full rounded-md bg-[#E09119] px-3 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#c77b07] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600"
            >
                ${msg("doLogIn")}
            </button>

          </div>
        </form>

    </#if>
</@layout.registrationLayout>
