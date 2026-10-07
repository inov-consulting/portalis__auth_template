<#import "template.ftl" as layout>
<@layout.htmlEmailLayout accentColor="#DC2626" category="SÉCURITÉ DU COMPTE">

  <!-- Alert banner -->
  <tr>
    <td style="background-color:#FFF5F5;border-left:3px solid #DC2626;padding:12px 24px;">
      <p style="margin:0;font-size:13px;color:#DC2626;font-weight:600;font-family:Arial,sans-serif;">✕&nbsp; [ALERTE] Activité suspecte détectée sur votre compte</p>
    </td>
  </tr>

  <!-- Main content -->
  <tr>
    <td style="padding:32px 32px 28px;font-family:Arial,Helvetica,sans-serif;">

      <p style="margin:0 0 12px;font-size:22px;font-weight:700;color:#1A1A1A;">Bonjour ${user.firstName!''},</p>
      <p style="margin:0 0 24px;font-size:14px;color:#555555;line-height:1.6;">Nous avons détecté plusieurs tentatives de connexion échouées sur votre compte PortaLis Sénégal. Si vous êtes à l'origine de ces tentatives, vous pouvez ignorer cet email.</p>

      <!-- Info table -->
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#F5F5F0;border-radius:8px;margin:0 0 20px;overflow:hidden;">
        <tr>
          <td style="padding:12px 16px;border-bottom:1px solid #E8E8E4;">
            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
              <tr>
                <td style="font-size:13px;color:#6B7280;font-family:Arial,sans-serif;">Dernière tentative</td>
                <td align="right" style="font-size:13px;font-weight:700;color:#1A1A1A;font-family:Arial,sans-serif;">${event.date!''}</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td style="padding:12px 16px;">
            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
              <tr>
                <td style="font-size:13px;color:#6B7280;font-family:Arial,sans-serif;">Adresse IP</td>
                <td align="right" style="font-size:13px;font-weight:700;color:#1A1A1A;font-family:Arial,sans-serif;">${event.ipAddress!''}</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>

      <!-- Red warning box -->
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:0 0 28px;">
        <tr>
          <td style="background-color:#FFF5F5;border-left:3px solid #DC2626;border-radius:0 6px 6px 0;padding:12px 16px;">
            <p style="margin:0;font-size:13px;color:#DC2626;line-height:1.5;font-family:Arial,sans-serif;">Si vous ne reconnaissez pas cette activité, votre compte est peut-être ciblé. <strong>Modifiez votre mot de passe immédiatement.</strong></p>
          </td>
        </tr>
      </table>

      <p style="margin:0 0 24px;font-size:12px;color:#9CA3AF;text-align:center;font-style:italic;font-family:Arial,sans-serif;">Si vous pensez que votre compte a été compromis, contactez immédiatement votre administrateur PortaLis.</p>

      <p style="margin:0 0 4px;font-size:13px;color:#555555;font-family:Arial,sans-serif;">Cordialement,</p>
      <p style="margin:0;font-size:13px;font-weight:700;color:#1A1A1A;font-family:Arial,sans-serif;">L'équipe PortaLis Sénégal</p>
    </td>
  </tr>

</@layout.htmlEmailLayout>
