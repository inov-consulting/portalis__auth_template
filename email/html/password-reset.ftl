<#import "template.ftl" as layout>
<@layout.htmlEmailLayout accentColor="#1B6B45" category="SÉCURITÉ DU COMPTE">

  <!-- Main content -->
  <tr>
    <td style="padding:32px 32px 28px;font-family:Arial,Helvetica,sans-serif;">

      <p style="margin:0 0 12px;font-size:22px;font-weight:700;color:#1A1A1A;">Bonjour ${user.firstName!''},</p>
      <p style="margin:0 0 24px;font-size:14px;color:#555555;line-height:1.6;">Nous avons reçu une demande de réinitialisation du mot de passe de votre compte PortaLis Sénégal. Cliquez sur le bouton ci-dessous pour choisir un nouveau mot de passe.</p>

      <!-- Action button -->
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:0 0 16px;">
        <tr>
          <td align="center">
            <a href="${link}" style="display:inline-block;background-color:#1B6B45;color:#ffffff;text-decoration:none;font-size:14px;font-weight:700;padding:13px 32px;border-radius:8px;font-family:Arial,sans-serif;">Réinitialiser mon mot de passe</a>
          </td>
        </tr>
      </table>

      <!-- Expiry warning -->
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:0 0 20px;">
        <tr>
          <td style="background-color:#FFFBEB;border:1px solid #FDE68A;border-radius:6px;padding:12px 16px;">
            <p style="margin:0;font-size:13px;color:#92400E;line-height:1.5;font-family:Arial,sans-serif;">⚠&nbsp; Ce lien est valable ${linkExpirationFormatter(linkExpiration)!'1 heure'}. Passé ce délai, vous devrez effectuer une nouvelle demande.</p>
          </td>
        </tr>
      </table>

      <!-- Request details table -->
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#F5F5F0;border-radius:8px;margin:0 0 20px;overflow:hidden;">
        <tr>
          <td style="padding:12px 16px;border-bottom:1px solid #E8E8E4;">
            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
              <tr>
                <td style="font-size:13px;color:#6B7280;font-family:Arial,sans-serif;">Demandé le</td>
                <td align="right" style="font-size:13px;font-weight:700;color:#1A1A1A;font-family:Arial,sans-serif;">${.now?string["dd MMMM yyyy 'à' HH'h'mm"]}</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td style="padding:12px 16px;">
            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
              <tr>
                <td style="font-size:13px;color:#6B7280;font-family:Arial,sans-serif;">Compte</td>
                <td align="right" style="font-size:13px;font-weight:700;color:#1A1A1A;font-family:Arial,sans-serif;">${user.email!''}</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>

      <p style="margin:0 0 24px;font-size:12px;color:#9CA3AF;text-align:center;font-style:italic;font-family:Arial,sans-serif;">Vous n'êtes pas à l'origine de cette demande ?<br/>Ignorez cet email. Votre mot de passe actuel reste inchangé.</p>

      <p style="margin:0 0 4px;font-size:13px;color:#555555;font-family:Arial,sans-serif;">Cordialement,</p>
      <p style="margin:0;font-size:13px;font-weight:700;color:#1A1A1A;font-family:Arial,sans-serif;">L'équipe PortaLis Sénégal</p>
    </td>
  </tr>

</@layout.htmlEmailLayout>
