using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Primitives;
using System.Text;

[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
public class BasicAuthenticationAttribute : Attribute, IAuthorizationFilter
{
    public void OnAuthorization(AuthorizationFilterContext context)
    {
        StringValues authorizationHeader;

        if (!context.HttpContext.Request.Headers.TryGetValue("Authorization", out authorizationHeader))
        {
            context.Result = new Microsoft.AspNetCore.Mvc.UnauthorizedResult();
            return;
        }

        var authHeader = authorizationHeader.ToString();

        if (!authHeader.StartsWith("Basic"))
        {
            context.Result = new Microsoft.AspNetCore.Mvc.UnauthorizedResult();
            return;
        }

        var encodedUsernamePassword = authHeader.Split(' ', 2, StringSplitOptions.RemoveEmptyEntries)[1]?.Trim();
        var decodedUsernamePassword = Encoding.UTF8.GetString(Convert.FromBase64String(encodedUsernamePassword));
        var username = decodedUsernamePassword.Split(':', 2)[0];
        var password = decodedUsernamePassword.Split(':', 2)[1];

        if (IsAuthenticated(username, password))
        {
            return;
        }

        context.Result = new Microsoft.AspNetCore.Mvc.UnauthorizedResult();
    }

    private bool IsAuthenticated(string username, string password)
    {
        // Hardcoded credentials 
        return username == "user" && password == "password";
    }
}