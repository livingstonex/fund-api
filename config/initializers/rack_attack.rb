class Rack::Attack
    throttle('api_ip', limit: 5, period: 60.seconds) do |req|
        req.ip if req.subdomain == 'api'
    end

    throttle('login_ip', limit: 2, period: 60.seconds) do |req|
        if req.path == '/api/v1/login' && req.post?
            # req.ip
            req.params['email'].to_s.downcase.gsub(/\s+/, "")
        end
    end

    throttle('signup_ip', limit: 5, period: 120.seconds) do |req|
        if req.path == '/api/v1/signup' && req.post?
            req.params['email'].to_s.downcase.gsub(/\s+/, "")
        end
    end

    # throttle('events_ip', limit: 10, period: 30.seconds) do |req|
    #     if req.path == '/api/v1/events' && req.get?
    #         req.ip
    #     end
    # end

    class Request < ::Rack::Request
        def subdomain
            host.split('.').first
        end
    end
end