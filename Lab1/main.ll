; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@global_var = dso_local global i32 100, align 4
@gravity = dso_local constant float 0x40239999A0000000, align 4
@.str = private unnamed_addr constant [27 x i8] c"The factorial of %d is %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [47 x i8] c"The area of a circle with radius %.2f is %.2f\0A\00", align 1
@uninitialized_global = dso_local global i32 0, align 4
@.str.2 = private unnamed_addr constant [42 x i8] c"Global var: %d, Uninitialized global: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store i32 0, i32* %1, align 4
  store i32 5, i32* %2, align 4
  %5 = load i32, i32* %2, align 4
  %6 = load i32, i32* %2, align 4
  %7 = call i32 @factorial(i32 noundef %6)
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0), i32 noundef %5, i32 noundef %7)
  store float 2.000000e+00, float* %3, align 4
  %9 = load float, float* %3, align 4
  %10 = load float, float* %3, align 4
  %11 = fmul float %9, %10
  %12 = fpext float %11 to double
  %13 = fmul double 3.141590e+00, %12
  %14 = fptrunc double %13 to float
  store float %14, float* %4, align 4
  %15 = load float, float* %3, align 4
  %16 = fpext float %15 to double
  %17 = load float, float* %4, align 4
  %18 = fpext float %17 to double
  %19 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), double noundef %16, double noundef %18)
  %20 = load i32, i32* @global_var, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* @uninitialized_global, align 4
  %22 = load i32, i32* @global_var, align 4
  %23 = load i32, i32* @uninitialized_global, align 4
  %24 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([42 x i8], [42 x i8]* @.str.2, i64 0, i64 0), i32 noundef %22, i32 noundef %23)
  ret i32 0
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @factorial(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp sle i32 %4, 1
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 1, i32* %2, align 4
  br label %13

7:                                                ; preds = %1
  %8 = load i32, i32* %3, align 4
  %9 = load i32, i32* %3, align 4
  %10 = sub nsw i32 %9, 1
  %11 = call i32 @factorial(i32 noundef %10)
  %12 = mul nsw i32 %8, %11
  store i32 %12, i32* %2, align 4
  br label %13

13:                                               ; preds = %7, %6
  %14 = load i32, i32* %2, align 4
  ret i32 %14
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
