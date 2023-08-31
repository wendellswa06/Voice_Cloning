FROM python:3.7

WORKDIR /vct
COPY . /vct/

RUN apt-get update && apt-get install libportaudio2 libportaudiocpp0 portaudio19-dev libasound-dev libsndfile1-dev -y && pip install pyaudio
RUN apt-get update -y && apt-get install -y --no-install-recommends build-essential gcc \
                                        libsndfile1

RUN pip install ffmpeg
RUN pip install torch torchvision torchaudio


RUN pip install -r requirements.txt
CMD ["python", "demo_cli.py"]
