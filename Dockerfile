FROM cimg/base:stable

RUN git clone -b v1.0.2 --depth 1 https://github.com/tfutils/tfenv.git /home/circleci/.tfenv
RUN git clone -b v0.0.3 --depth 1 https://github.com/cunymatthieu/tgenv.git /home/circleci/.tgenv
RUN chmod -R 755 /home/circleci/.tfenv/bin/terraform
RUN chmod -R 755 /home/circleci/.tgenv/bin/terragrunt

RUN echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> /home/circleci/.bashrc
RUN echo 'export PATH="$HOME/.tgenv/bin:$PATH"' >> /home/circleci/.bashrc

RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install
