<#import "reset-flow-layout.ftl" as layout>
<@layout.resetFlowLayout step=1; section>
    <#if section = "form">
      <p class="form-eyebrow">Sécurité du compte</p>
      <h2 class="form-title">${msg("forgotPasswordTitle")}</h2>
      <p class="form-desc">${msg("forgotPasswordInstruction")}</p>

      <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
        <div class="field">
          <label class="field-label" for="username">${msg("emailLabel")}</label>
          <div class="field-wrap">
            <span class="field-pre" aria-hidden="true">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
            </span>
            <input
              type="email"
              id="username"
              name="username"
              placeholder="${msg("emailPlaceholder")}"
              class="field-input"
              autofocus
              autocomplete="email"
              autocapitalize="none"
              autocorrect="off"
              required
            />
          </div>
          <#if messagesPerField.existsError('email')>
            <span class="text-red-800 text-xs" aria-live="polite">
              ${kcSanitize(messagesPerField.get('email'))?no_esc}
            </span>
          </#if>
        </div>

        <button type="submit" class="btn-primary" 
          style="background:#1B6B45;"
          onmouseover="if(!this.disabled)this.style.background='#1B6B45'"
          onmouseout="if(!this.disabled)this.style.background='#166239'">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
          ${msg("sendButton")}
        </button>

        <div class="mt-6 text-center text-sm text-gray-500">
          <a class="btn-back" href="${url.loginUrl}">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><line x1="19" y1="12" x2="5" y2="12"/><polyline points="12 19 5 12 12 5"/></svg>
            ${msg("backToLogin")}
          </a>
        </div>
      </form>
    </#if>
</@layout.resetFlowLayout>
