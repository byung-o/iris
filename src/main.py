import hydra
from omegaconf import DictConfig

from trainer import Trainer


@hydra.main(config_path="../config", config_name="trainer_minigrid")
def main(cfg: DictConfig):
    trainer = Trainer(cfg)
    trainer.run()


if __name__ == "__main__":
    main()
