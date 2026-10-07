<#import "template.ftl" as layout>
<@layout.htmlEmailLayout accentColor="#1B6B45" category="GÉNÉRAL">

  <!-- Illustration placeholder -->
  <tr>
    <td style="background-color:#F5F5F0;height:160px;text-align:center;vertical-align:middle;color:#BBBAB5;font-size:11px;font-family:Arial,sans-serif;text-transform:uppercase;letter-spacing:0.1em;">
      ILLUSTRATION — 600 × 160PX
    </td>
  </tr>

  <!-- Main content -->
  <tr>
    <td style="padding:32px 32px 28px;font-family:Arial,Helvetica,sans-serif;">

      <p style="margin:0 0 12px;font-size:22px;font-weight:700;color:#1A1A1A;">Bonjour ${user.firstName!''},</p>
      <p style="margin:0 0 24px;font-size:14px;color:#555555;line-height:1.6;">Votre compte PortaLis Sénégal a été créé avec succès. Définissez votre mot de passe pour accéder à la plateforme.</p>

      <!-- Info table -->
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#F5F5F0;border-radius:8px;margin:0 0 24px;overflow:hidden;">
        <tr>
          <td style="padding:12px 16px;border-bottom:1px solid #E8E8E4;">
            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
              <tr>
                <td style="font-size:13px;color:#6B7280;font-family:Arial,sans-serif;">Adresse e-mail</td>
                <td align="right" style="font-size:13px;font-weight:700;color:#1A1A1A;font-family:Arial,sans-serif;">${user.email!''}</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td style="padding:12px 16px;border-bottom:1px solid #E8E8E4;">
            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
              <tr>
                <td style="font-size:13px;color:#6B7280;font-family:Arial,sans-serif;">Rôle</td>
                <td align="right" style="font-size:13px;font-weight:700;color:#1A1A1A;font-family:Arial,sans-serif;">${(user.attributes["role"]?first)!'-'}</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td style="padding:12px 16px;">
            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
              <tr>
                <td style="font-size:13px;color:#6B7280;font-family:Arial,sans-serif;">Entreprise</td>
                <td align="right" style="font-size:13px;font-weight:700;color:#1A1A1A;font-family:Arial,sans-serif;">${(user.attributes["company"]?first)!'-'}</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>

      <!-- Action button -->
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:0 0 16px;">
        <tr>
          <td align="center">
            <a href="${link}" style="display:inline-block;background-color:#1B6B45;color:#ffffff;text-decoration:none;font-size:14px;font-weight:700;padding:13px 32px;border-radius:8px;font-family:Arial,sans-serif;">Définir mon mot de passe</a>
          </td>
        </tr>
      </table>

      <!-- Expiry warning -->
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:0 0 28px;">
        <tr>
          <td style="background-color:#FFFBEB;border:1px solid #FDE68A;border-radius:6px;padding:12px 16px;">
            <p style="margin:0;font-size:13px;color:#92400E;line-height:1.5;font-family:Arial,sans-serif;">⚠&nbsp; Ce lien est valable ${linkExpirationFormatter(linkExpiration)!'48 heures'}. Passé ce délai, contactez votre administrateur.</p>
          </td>
        </tr>
      </table>

      <p style="margin:0 0 4px;font-size:13px;color:#555555;font-family:Arial,sans-serif;">Cordialement,</p>
      <p style="margin:0;font-size:13px;font-weight:700;color:#1A1A1A;font-family:Arial,sans-serif;">L'équipe PortaLis Sénégal</p>
    </td>
  </tr>

</@layout.htmlEmailLayout>
