package hands.on.distroless;

import org.eclipse.microprofile.metrics.annotation.Timed;
import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/distroless")
@Produces(MediaType.APPLICATION_JSON)
@ApplicationScoped
public class DistrolessPayaraResource {

    @GET
    @Timed
    public Response distroless() {
        return Response.ok("Hands-on Distroless with Payara Micro").build();
    }
}
