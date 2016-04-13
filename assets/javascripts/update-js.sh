#/bin/bash
cd `dirname $0`
curl 'https://github.com/florentsolt/roadmap.js/raw/master/roadmap.min.js' > roadmap.min.js
curl 'http://cdnjs.cloudflare.com/ajax/libs/d3/3.5.2/d3.min.js' > d3.min.js