use Crust::Middleware;
use Log::Syslog::Native;

class Crust::Middleware::Syslog is Crust::Middleware { 
    method CALL-ME(%env) {
        my $logger = Log::Syslog::Native.new;
        %env<p6sgix.logger> = -> $level, $message {
            my $syslog-level = Log::Syslog::Native::Debug;
            given $level {
                when 'debug'  { $syslog-level = Log::Syslog::Native::Debug;    };
                when 'info'   { $syslog-level = Log::Syslog::Native::Info;     };
                when 'notice' { $syslog-level = Log::Syslog::Native::Notice;   };
                when 'warn'   { $syslog-level = Log::Syslog::Native::Warning;  };
                when 'error'  { $syslog-level = Log::Syslog::Native::Error;    };
                when 'fatal'  { $syslog-level = Log::Syslog::Native::Critical; };
                when 'alert'  { $syslog-level = Log::Syslog::Native::Alert;    };
            }
            $logger.log($level, $message);
        };
        return $.app()(%env);
    }
}
