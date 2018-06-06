/*! \file
 *  \copyright Copyright 2018 RnD Center "ELVEES", JSC
 *  \brief Содержит объявления функций, расширяющих стандарт OpenVX.
 *  \author Игорь Шаронов
 *  \date 2018.02.06
 */

#ifndef __OPENVX_EXTENDED_H__
#define __OPENVX_EXTENDED_H__

#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/*! \defgroup extended_performance Группа расширения стандарта OpenVX.
 *  \{
 */

//! Максимальное количество ядре DSP в статистике.
#define DSP_MAX_CORES 2

//! Расширение счётчиков производительности.
typedef struct dsp_extended_performance_t
{
    struct
    {
        uint32_t run_count; //!< Количество вызовов ядра процессора.
        uint64_t ticks; //!< Количество затраченных тактов.
        uint64_t timings; //!< Суммарное затраченное время.
    } cores[DSP_MAX_CORES]; //!< Массив со статистикой для каждого ядра.
    size_t cores_number; //!< Колчество ядер в структуре.
    uint64_t total_ticks; //!< Общее количество затраченных тактов.
    uint64_t total_timings; //!< Общее затраченное время.
    uint32_t total_count; //!< Общее количество вызовов.
    uint64_t dma_bytes; //!< Количество переданных байт через канал DMA.
    uint64_t dma_timing; //!< Затраченное время на копирование через канал DMA.
    void* specific; //!< Дополнительное поле для платформо зависимых счётчиков.
} dsp_extended_performance_t;

/*! \brief Получение расширенных счётчиков производительности.
 *  \param[out] performance указатель на структру со счётчиками производительности
 *  \return статус операции
 */
int dsp_extended_performance(dsp_extended_performance_t* performance);

//! \}

#ifdef __cplusplus
}
#endif

#endif // __OPENVX_EXTENDED_H__
