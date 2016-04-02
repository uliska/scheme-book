# Integrating Scheme in LilyPond

The second challenge is the integration of Scheme as an extension language in
LilyPond input files. Actually this works quite smoothly because LilyPond's
language itself is parsed in a way that is very close to Scheme.  But on the
other hand this affinity can be confusing to the user.  We will give particular
emphasis on disentangling these things by first giving a proper introduction to
the topic and then stressing this perspective when discussing the Scheme
concepts.
