module.exports = {
    routes: [
        {
            method: 'DELETE',
            path: '/logout',
            handler: 'refresh-token.deleteRefreshToken',
        },
    ]
}
