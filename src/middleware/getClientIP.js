const GetClientIP = (ctx) => {
    return ctx.request.ip || ctx.request.header['x-fowarded-for'] || 'unknown'
}

module.exports = GetClientIP