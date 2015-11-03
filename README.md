# Crust::Middleware::Syslog

    use Crust::Builder;
    use Crust::Middleware::Syslog;

    builder {
        enable 'Syslog';
        $app;
    }

or

    use Crust::Middleware::Syslog;

    $app = Crust::Middleware::Syslog.new($app);
