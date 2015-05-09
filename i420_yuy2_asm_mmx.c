#include "i420_yuy2.c"
#include "chroma_asm.h"

void cover_I420_YUY2_mmx( filter_t *p_filter, picture_t *p_source,
                                           picture_t *p_dest )
{
	I420_YUY2(p_filter, p_source, p_dest);
}

void cover_I420_YVYU_mmx( filter_t *p_filter, picture_t *p_source,
                                           picture_t *p_dest )
{
	I420_YVYU(p_filter, p_source, p_dest);
}

void cover_I420_UYVY_mmx( filter_t *p_filter, picture_t *p_source,
                                           picture_t *p_dest )
{
	I420_UYVY(p_filter, p_source, p_dest);
}

void cover_I420_cyuv_mmx( filter_t *p_filter, picture_t *p_source,
                                           picture_t *p_dest )
{
	I420_cyuv(p_filter, p_source, p_dest);
}
