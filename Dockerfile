FROM n8nio/n8n:latest

# Run as root so we can fix volume permissions at startup
USER root

# Create entrypoint that chowns the data dir then drops to node user
RUN printf '#!/bin/sh\nchown -R node:node /home/node/.n8n 2>/dev/null || true\nexec su-exec node n8n\n' > /fix-perms.sh \
    && chmod +x /fix-perms.sh

    ENTRYPOINT ["/fix-perms.sh"]
