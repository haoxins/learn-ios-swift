
const router = require('koa-router')()
const views = require('koa-views')
const path = require('path')
const koa = require('koa')
const app = koa()

app.use(views(path.join(__dirname, 'view'), {
  map: {
    html: 'nunjucks'
  }
}))

router.get('/', function *(next) {
  yield this.render('index')
})

app.use(router.routes())
app.use(router.allowedMethods())

console.info('port: 3000')
app.listen(3000)
