module.exports = {
    routes: [
        {
            method: 'GET',
            path: '/authcheck/:userId/:username',
            handler: 'refresh-token.refreshAccessToken',
            config: {
                auth: false
            }
        },
        {
            method: 'DELETE',
            path: '/logout/:user_id',
            handler: 'refresh-token.deleteRefreshToken',
            config: {
                auth: false
            }
        },
    ]
}
