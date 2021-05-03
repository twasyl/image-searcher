
FROM curlimages/curl AS GATHERER

ENV LANGUAGE=eng

RUN curl -L -s -o /tmp/eng.traineddata https://github.com/tesseract-ocr/tessdata/raw/master/$LANGUAGE.traineddata

FROM clearlinux/tesseract-ocr

ENV SEARCHED_WORDS="master slave blacklist whitelist"
ENV LANGUAGE=eng
ENV DATA_DIR="/work"

COPY --from=GATHERER /tmp/$LANGUAGE.traineddata /usr/share/tessdata/
COPY analysis.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/analysis.sh

WORKDIR /work

ENTRYPOINT [ "analysis.sh" ]