#lang racket

;TODO: Also provide a rune
;TODO: Also provide a minimal once-upon-a-time, already modded
(provide my-cool-particles
         codespells-demo-mod-lang)

(require codespells
         racket/runtime-path)

(define-runtime-path mod-location "./Paks")

(define (my-cool-particles)
  (spawn-mod-blueprint mod-location
                       "CodeSpellsParticles" ; TODO: More standard name?
                       "TestParticleBP"))

(define (codespells-demo-mod-lang #:with-paren-runes? [with-paren-runes? #f])
  (local-require codespells-runes 2htdp/image)
  (rune-lang 'codespells/demo-aether
             (append
              (if with-paren-runes?
                  (list
                   (html-rune '|(| 
                              (open-paren-rune))

                   (html-rune '|)|
                              (close-paren-rune)))
                  (list))
              (list
               (html-rune 'my-cool-particles
                          (svg-rune-description
                           (rune-background
                            #:color "green"
                            (rune-image
                             (circle 40 'solid 'purple)))))))))

;TODO: raco tool to create new mod project --
;   with Unreal project template?
;   Something already working and testable.

;This is just so you can conveniently test your mod function
;  by executing this file.
;To release your mod, push to github, have someone install your
;  Racket package, and... [What's standard configuration?]
;  Wrap the aether and wrap the world?  (Maybe just aether?)
;  Do they need to create a new language module for eval?
(module+ main
  
  (at [0 0 0]
      (my-cool-particles))

  )