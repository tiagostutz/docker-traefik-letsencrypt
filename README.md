# Docker Traefik Let's Encrypt Images
Traefik Let's Encrypt ready Docker images for you to go.

- OnHost
- HTTP Challenge based

```
version: '3.5'

services:
  traefik-letsencrypt:
    image: tiagostutz/traefik-letsencrypt:1.6-httpchallenge
    environment:
      - LETS_ENCRYPT_TEST_MODE=true
      - LETS_ENCRYPT_EMAIL=your@email.com
    ports:
      - 88:80
      - 8088:8080
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
  
  whoami1:
    image: emilevauge/whoami
    network_mode: bridge
    restart: always 
    labels:
      - "traefik.backend=whoami"
      - "traefik.frontend.rule=Host:yourdomain.com"      
```
