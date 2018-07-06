[DRAFT]

# Docker Traefik Let's Encrypt Images 
Traefik Let's Encrypt ready Docker images for you to go.

- OnHost
- HTTP Challenge based

```
version: '3.5'

services:
  traefik-letsencrypt:
    image: tiagostutz/traefik-letsencrypt:1.6
    network_mode: bridge
    environment:
      - LETS_ENCRYPT_TEST_MODE=false
      - LETS_ENCRYPT_EMAIL=your@email.com
      - SWARM_MODE=false
    ports:
      - 80:80
      - 443:443
      - 8080:8080
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
  
  whoami:
    image: emilevauge/whoami
    network_mode: bridge
    restart: always 
    labels:
      - traefik.backend=whoami
      - traefik.frontend.rule=Host:yourdomain.com
      - traefik.frontend.entryPoints=https
```

## Environment Variables

`LETS_ENCRYPT_TEST_MODE`:

- If set `true` will issue an insecure certificate from "Fake LE" (Fake Let's Encrypt).
- If set `false` will issue a valid secure certificate


`LETS_ENCRYPT_EMAIL`:

Your Let's Encrypt account e-mail. Among other things, will be used to receive certificate expiration notice.


`SWARM_MODE`:

You can use this image both in Docker stand alone as in Docker Swarm (formely swarm mode). This is a argument that traefik uses to know how to handle the container/service subscription and networking