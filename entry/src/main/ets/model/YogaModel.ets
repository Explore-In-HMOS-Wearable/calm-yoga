export interface YogaModel {
  title: string
  desc?: string
  trainingImagePath: Resource
  yogaImagePath: Resource
  time: number
}

export const YOGA_TRAINING: YogaModel[] = [
  {
    title: 'Mountain Pose',
    time: 30,
    trainingImagePath: $r('app.media.mountain'),
    yogaImagePath: $r('app.media.mountain_yoga')
  },
  {
    title: 'Cat–Cow',
    time: 30,
    trainingImagePath: $r('app.media.cat_cow'),
    yogaImagePath: $r('app.media.cat_cow_yoga')
  },
  {
    title: 'Cobra Pose',
    time: 30,
    trainingImagePath: $r('app.media.cobra_pose'),
    yogaImagePath: $r('app.media.cobra_yoga')
  },
  {
    title: 'Downward Dog',
    time: 40,
    trainingImagePath: $r('app.media.downward'),
    yogaImagePath: $r('app.media.downward_yoga')
  },
  {
    title: 'Child’s Pose',
    time: 40,
    trainingImagePath: $r('app.media.childs_pose'),
    yogaImagePath: $r('app.media.childs_yoga')
  },
  {
    title: 'Seated Forward Bend',
    time: 40,
    trainingImagePath: $r('app.media.seated_forward'),
    yogaImagePath: $r('app.media.seated_forward_yoga')
  },
  {
    title: 'Tree Pose',
    time: 30,
    trainingImagePath: $r('app.media.tree'),
    yogaImagePath: $r('app.media.tree_yoga')
  },
  {
    title: 'Warrior I',
    time: 30,
    trainingImagePath: $r('app.media.warrior_I'),
    yogaImagePath: $r('app.media.warrior_I_yoga')
  },
  {
    title: 'Warrior II',
    time: 30,
    trainingImagePath: $r('app.media.warrior_II'),
    yogaImagePath: $r('app.media.warrior_II_yoga')
  },
  {
    title: 'Plank Pose',
    time: 20,
    trainingImagePath: $r('app.media.plank'),
    yogaImagePath: $r('app.media.plank_yoga')
  },
  {
    title: 'Boat Pose',
    time: 20,
    trainingImagePath: $r('app.media.boat_pose'),
    yogaImagePath: $r('app.media.boat_yoga')
  }
]
