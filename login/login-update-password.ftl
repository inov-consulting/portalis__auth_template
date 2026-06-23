<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
  <#if section = "header">
    ${msg("updatePasswordTitle")}
  <#elseif section = "form">

    <h2 class="py-2 text-2xl mt-5 text-gray-800">${msg("passwordResetTitle")}</h2>

    <p class="text-gray-700 text-sm">
        ${msg("passwordResetDesc")}
    </p>

    <form id="kc-passwd-update-form" class="" action="${url.loginAction}" method="post">
      <#--<input type="hidden" id="username" name="username" value="${username}" readonly="readonly"/>-->
      <#--<input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>-->
      <div class="py-5">
        <label for="password" class="block">
                      <span
                        class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700"
                      >
                      ${msg("passwordNew")}
                      </span>
          <input type="password" id="password-new" name="password-new" autofocus autocomplete="new-password" placeholder=""  class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500"/>

        </label>
      </div>
      <div class="py-3">
        <label for="password-confirm" class="block">
                      <span
                        class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700"
                      >
                      ${msg("passwordConfirm")}
                      </span>
          <input type="password" id="password-confirm" name="password-confirm"  autocomplete="new-password" placeholder=""  class="block w-full bg-[#fff] text-gray-600 placeholder:text-gray-400 text-sm border border-gray-300 rounded-lg py-2.5 px-3 focus:outline-none focus:ring-1 focus:ring-[#E09119] focus:border-[#E09119] invalid:border-pink-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-500"/>

        </label>
      </div>

      <div class="pb-2 mt-3">
        <button  type="submit"
                 class="w-full rounded-md bg-[#E09119] px-3 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#c77b07] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600"
        >
            ${msg("doSubmit")}
        </button>
      </div>


    </form>
  </#if>
</@layout.registrationLayout>
