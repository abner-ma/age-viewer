FROM node:14-alpine3.16

# pm2在版本6之后需要更高的nodejs版本，故限制在使用pm2的版本5
RUN npm install pm2@5

WORKDIR /src

COPY . .

RUN npm run setup

# 运行时发现缺少babel/runtime，故额外安装
RUN cd backend && npm install @babel/runtime && cd ..

CMD ["npm", "run", "start"]

EXPOSE 3000
