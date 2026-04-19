import SwiftUI

struct ContentView: View {
    
    @State private var cycleDay: Double = 1
    
    var body: some View {
        let phase = getPhase(day: Int(cycleDay))
        let advice = getAdvice(phase: phase)
        let color = getPhaseColor(phase: phase)
        
        ZStack {
            // Фон
            LinearGradient(
                colors: [color.opacity(0.2), .white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                // Заголовок
                Text("CycleSync")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Умное питание и тренировки")
                    .foregroundColor(.gray)
                
                // Карточка дня цикла
                VStack(spacing: 10) {
                    Text("День цикла")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("\(Int(cycleDay))")
                        .font(.system(size: 48, weight: .bold))
                    
                    Slider(value: $cycleDay, in: 1...28, step: 1)
                        .tint(color)
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                
                // Карточка фазы
                VStack(spacing: 10) {
                    Text("Фаза")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(phase)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(color)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                
                // Карточка рекомендаций
                VStack(alignment: .leading, spacing: 10) {
                    Text("Рекомендации")
                        .font(.headline)
                    
                    Text(advice)
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                
                Spacer()
            }
            .padding()
        }
    }
}

// MARK: - Логика фаз

func getPhase(day: Int) -> String {
    if day <= 5 {
        return "Менструация"
    } else if day <= 13 {
        return "Фолликулярная фаза"
    } else if day <= 16 {
        return "Овуляция"
    } else {
        return "Лютеиновая фаза"
    }
}

// MARK: - Рекомендации

func getAdvice(phase: String) -> String {
    switch phase {
        
    case "Менструация":
        return "Сфокусируйся на отдыхе, лёгкой активности и продуктах с железом (шпинат, красное мясо)"
        
    case "Фолликулярная фаза":
        return "Добавь больше углеводов, увеличивай нагрузки и пробуй силовые тренировки"
        
    case "Овуляция":
        return "Пик энергии! Отличное время для интенсивных тренировок и достижения рекордов"
        
    case "Лютеиновая фаза":
        return "Снизь интенсивность, добавь полезные жиры и сосредоточься на восстановлении"
        
    default:
        return ""
    }
}

// MARK: - Цвета фаз

func getPhaseColor(phase: String) -> Color {
    switch phase {
    case "Менструация":
        return .red
    case "Фолликулярная фаза":
        return .blue
    case "Овуляция":
        return .green
    case "Лютеиновая фаза":
        return .orange
    default:
        return .gray
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
