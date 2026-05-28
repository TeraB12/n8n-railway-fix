FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache su-exec \
    && printf '#!/bin/sh\nchown -R node:node /home/node/.n8n 2>/dev/null || true\nexec su-exec node n8n\n' > /fix-perms.sh \
        && chmod +x /fix-perms.sh

        ENTRYPOINT ["/fix-perms.sh"]
        
