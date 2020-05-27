package hands.on.distroless;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DistrolessSpringController {

    @GetMapping("/api/distroless")
    public String distroless() {
        return "Hands-on Distroless with Spring Boot";
    }

}
