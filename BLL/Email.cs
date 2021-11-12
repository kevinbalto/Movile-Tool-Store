using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Net;
using System.Net.Mail;
using System.Net.Mime;

namespace BLL
{
    public class Email
    {

        public void enviarCorreo(Comentario comentario, string urlImagen)
        {
            try
            {
                MailMessage email = new MailMessage();

                email.To.Add(new MailAddress(comentario.correo));
                email.To.Add(new MailAddress("mobiletoolstoreoficial@gmail.com"));
                email.From = new MailAddress("mobiletoolstoreoficial@gmail.com");
                email.Subject = "Recepcion de comentario MTS.";

                string html = "Mobile Tool Store, gracias por su comentario.";
                html += "<br>A continuacion se le adjunta la informacion recibida de su comentario.";
                html += "<br><b>Nombre Completo: <b>" + comentario.nombreCompleto;
                html += "<br><b>Telefóno: <b>" + comentario.telefono;
                html += "<br><b>Correo: <b>" + comentario.correo;

                html += "<br>Por favor, no responda a este correo, fue generado de manera automatica.";
                html += "<br><br><img src='cid:imagen'/>";

                email.IsBodyHtml = true;
                email.Priority = MailPriority.Normal;
                Attachment item = new Attachment(urlImagen);
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(html,
                    Encoding.UTF8, MediaTypeNames.Text.Html);
                LinkedResource img = new LinkedResource(urlImagen, MediaTypeNames.Image.Jpeg);
                img.ContentId = "imagen";
                htmlView.LinkedResources.Add(img);
                email.Attachments.Add(item);
                email.AlternateViews.Add(htmlView);
                SmtpClient smtp = new SmtpClient();             
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("mobiletoolstoreoficial@gmail.com",
                    "somosucr2020");
                smtp.Send(email);
                email.Dispose();
                smtp.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
