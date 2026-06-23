<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("emailForgotTitle")}
    <#elseif section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "back">

    <#elseif section = "form">

      <h2 class="text-center font-poppins font-semibold text-2xl mt-5 text-gray-800 mb-[10px]">${msg("forgotPasswordTitle")}</h2>

      <p class="text-gray-700 text-center font-poppins mb-[20px]" style="font-size:13px;">
          ${msg("forgotPasswordInstruction")}
      </p>

      
        <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
          <div class="py-2">
              <label for="email" class="block">
                  <span class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700">
                      ${msg("emailLabel")}
                  </span>
                  <input type="email"
                         id="username"
                         name="username"
                         placeholder="${msg("emailPlaceholder")}"
                         class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500"
                         autofocus
                         autocomplete="off" />
              </label>
              <#if messagesPerField.existsError('email')>
                  <span class="text-red-800 text-xs" aria-live="polite">
                      ${kcSanitize(messagesPerField.get('email'))?no_esc}
                  </span>
              </#if>
          </div>
          <div class="pb-2 mt-3">
            <button  type="submit"
                     class="w-full rounded-md bg-[#E09119] px-3 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#c77b07] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600"
            >
                ${msg("sendButton")}
            </button>
          </div>

          <div class="mt-3 text-center text-sm text-gray-500">
              <a class="text-[#182F7C] hover:text-[#E09119] hover:underline flex items-center justify-center" href="${url.loginUrl}">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 mr-1">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
                  </svg>
                  ${msg("backToLogin")}
              </a>
          </div>

        </form>
    </#if>
</@layout.registrationLayout>
