<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
    ${message.summary}
    <#elseif section = "header">
    ${message.summary}
    <#elseif section = "back">

    <#elseif section = "form">
      <div class="pb-2 mt-10">
        <div class="flex items-center p-4 mb-4 text-sm text-green-700  rounded-lg bg-green-50 " role="alert">
          <svg class="flex-shrink-0 inline w-4 h-4 mr-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
            <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
          </svg>
          <span class="sr-only">Info</span>
          <div>
            <span class="font-medium">${message.summary}</span>
             <#if requiredActions??><p><#list requiredActions>
                <ul class="list list-bullet">
                    <#items as reqActionItem><li>${msg("requiredAction.${reqActionItem}")}</li></#items>
                </ul>
              </#list></p></#if>

              <#if skipLink??>


              <#else>
                  <#if pageRedirectUri??>
                    <p><a class="button" href="${pageRedirectUri}">${msg("backToApplication")?no_esc}</a></p>
                  <#elseif actionUri??>
                    <p class="pt-2"><b><a class="" href="${actionUri}">${msg("proceedWithAction")?no_esc}</a></b></p>
                  <#elseif client.baseUrl??>
                    <p><a class="button" href="${client.baseUrl}">${msg("backToApplication")?no_esc}</a></p>
                  </#if>
              </#if>
          </div>
        </div>
        <div class="pb-2 mt-12 inline justify-center">
          <#if client?? && client.baseUrl?has_content>
            <a class="" href="${client.baseUrl}">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 inline">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
              </svg>
                ${msg("backToApplication")}
            </a>
          </#if>
        </div>
      </div>

    </#if>
</@layout.registrationLayout>
