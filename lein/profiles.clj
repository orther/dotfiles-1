{:user {:dependencies [[pjstadig/humane-test-output "0.7.0"]
                       [spyscope "0.1.5"]
                       [criterium "0.4.3"]]
        ; :global-vars (*warn-on-reflection* true)
        :injections [(require 'pjstadig.humane-test-output)
                     (require 'spyscope.core)
                     (pjstadig.humane-test-output/activate!)]
        :plugins [[cider/cider-nrepl "0.8.2"]]}}
