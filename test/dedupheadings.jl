
@testset "toc" begin
  doc = test_pandoc(
    """
    # panvimdoc

    # TLDR

    ## Summary 1
    ## Summary 2

    # Motivation

    # References
    """;
    toc = true,
    dedup_subheadings = true,
  )
  @test """
*test.txt*                                                    Test Description

==============================================================================
Table of Contents                                     *test-table-of-contents*

1. panvimdoc                                                  |test-panvimdoc|
2. TLDR                                                            |test-tldr|
  - Summary 1                                            |test-tldr-summary-1|
  - Summary 2                                            |test-tldr-summary-2|
3. Motivation                                                |test-motivation|
4. References                                                |test-references|

==============================================================================
1. panvimdoc                                                  *test-panvimdoc*


==============================================================================
2. TLDR                                                            *test-tldr*


SUMMARY 1                                                *test-tldr-summary-1*


SUMMARY 2                                                *test-tldr-summary-2*


==============================================================================
3. Motivation                                                *test-motivation*


==============================================================================
4. References                                                *test-references*

Generated by panvimdoc <https://github.com/kdheepak/panvimdoc>

vim:tw=78:ts=8:noet:ft=help:norl:
""" == doc
end
